import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:qjay/models/request.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/ble/permission_handler.dart';
import 'package:qjay/transport/proto/error.pb.dart' show GenericError;
import 'package:qjay/transport/proto/error.pbenum.dart';
import 'package:universal_ble/universal_ble.dart';

import 'package:qjay/models/common.dart';
import 'package:qjay/models/response.dart';
import 'package:qjay/transport/proto/request.pb.dart';
import 'package:qjay/transport/proto/response.pb.dart' as proto;
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_dynamic.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:uuid/uuid.dart';

import '../proto/error.pb.dart' as pberror;
import 'client.dart';

class TransportBle extends TransportDynamic {
  @override bool get isMock => false;

  BleClient? _connectedDevice;
  BleDevice? _candidateDevice;
  Completer<BleDevice?>? _scanCompleter;

  StreamSubscription<bool>? _deviceConnectedStream;
  
  int _mockModeCounter = 0;
  Timer? _mockModeTimer;

  bool isSetup = false;

  final _connectionStream = StreamController<ConnectionEvent>.broadcast();
  @override Stream<ConnectionEvent> get connectionStream => _connectionStream.stream;

  final _updaterStream = StreamController<UpdaterEvent>.broadcast();
  @override Stream<UpdaterEvent> get updaterStream => _updaterStream.stream;

  final _streamController = StreamController<TransportEvent>.broadcast();
  @override Stream<TransportEvent> get eventStream => _streamController.stream;

  void _onAvailablityChanged(AvailabilityState state) {
    switch (state) {
      case AvailabilityState.unauthorized:
        _connectionStream.add(ConnectionUnauthorizedEvent());
        return;
      case AvailabilityState.poweredOff:
      _connectedDevice?.disconnect();
        _connectionStream.add(ConnectionDisabledEvent());
        return;
      case AvailabilityState.unknown:
      case AvailabilityState.unsupported:
        _connectionStream.add(ConnectionUnsupportedEvent());
        return;
      default:
        break;
    }
  }

  void _onConnectedChanged(bool isConnected) {
    if (isConnected) {
      return;
    }
    
    _connectedDevice?.dispose();
    _connectedDevice = null;
    _connectionStream.add(ConnectionDisconnectedEvent());
  }

  Future<void> _onDeviceFound(BleDevice device) async {

    if (_scanCompleter != null && !(_scanCompleter!.isCompleted)) {
      _scanCompleter!.complete(device);
    }

    await UniversalBle.stopScan();
  }

  @override
  Future<void> scan() async {
    if (_scanCompleter != null) return;

    final availablity = await UniversalBle.getBluetoothAvailabilityState();
    switch (availablity) {
      case AvailabilityState.poweredOn:
        break;
      case AvailabilityState.resetting:
        _connectionStream.add(ConnectionRetryEvent());
        return;
      case AvailabilityState.unauthorized:
        _connectionStream.add(ConnectionUnauthorizedEvent());
        return;
      case AvailabilityState.poweredOff:
        const timeout = Duration(milliseconds: 500);
        const threshold = 10;

        _mockModeTimer?.cancel();
        _mockModeTimer = Timer(timeout, () {
          _mockModeCounter = 0;
        });
        
        _mockModeCounter++;

        if (_mockModeCounter >= threshold) {
          _mockModeCounter = 0;
          _mockModeTimer?.cancel();
          _mockModeTimer = null;

          _streamController.add(SwitchToMockMode());
        }

        _connectionStream.add(ConnectionDisabledEvent());
        return;
      case AvailabilityState.unknown:
      case AvailabilityState.unsupported:
        _connectionStream.add(ConnectionUnsupportedEvent());
        return;
    }

    if (Platform.isAndroid) {
      bool hasPermissions = await PermissionHandler.arePermissionsGranted();
      if (!hasPermissions) {
        _connectionStream.add(ConnectionUnauthorizedEvent());
        return;
      }
    }

    _connectionStream.add(ConnectionScanningEvent());
    _scanCompleter = Completer<BleDevice?>();
    await UniversalBle.stopScan();
    
    List<BleDevice> devices = await UniversalBle.getSystemDevices(
      withServices: [qjayServiceUuid],
    );

    for (final device in devices) {
      await _onDeviceFound(device);
    }
    await UniversalBle.startScan(
      scanFilter: ScanFilter(
        withServices: [qjayServiceUuid]
      ),
    );

    final candidateDevice = await _scanCompleter!.future
      .timeout(const Duration(seconds: 10), onTimeout: () => null);

    if (candidateDevice == null) {
      _connectionStream.add(ConnectionNotFoundEvent());
    } else {
      _candidateDevice = candidateDevice;      
      await connect();
    }

    _candidateDevice = null;
    _scanCompleter = null;
  }

  @override
  Future<void> connect() async {
    _connectionStream.add(ConnectionConnectingEvent());

    final device = _candidateDevice;
    _candidateDevice = null;
    
    if (device == null) {
      _connectionStream.add(ConnectionNotFoundEvent());
      return;
    }
    
    final bleDevice = await BleClient.fromDevice(
      device: device,
      onPlayerStateUpdated: (value) {
        _streamController.add(TransportEventStateUpdated(PlayerState.fromValue(value[0])));
      },
      onPlayerProgressUpdated: (value) {
        final progress = ByteData.sublistView(value).getFloat32(0, Endian.little);
        _streamController.add(TransportEventProgressUpdated(Duration(seconds: (1000 * progress).toInt()), Duration(seconds: 1000)));
      },
      onCurrentSongUpdated: (value) {
        final uuid = value.toUuidString();
        
        handleWithResponse<List<Song>>(ProtoRequest.getSong(uuid)).then((song) {
          switch (song) {
            case Ok<List<Song>>():
              _streamController.add(TransportEventSongUpdated(song.value.first));
            case Err<List<Song>>():
              print("BLE song parsing error");
              return null;
          }
        });
      },
      onCurrentPresetUpdated: (value) {
        try {
          final response = proto.Response.fromBuffer(value);

          if (response.hasError()) {
            _streamController.add(TransportEventError(response.error));
            return;
          }

          if (response.hasUpdateProgressEvent()) {
            _updaterStream.add(response.updateProgressEvent.toEvent());
            return;
          }

          if (response.hasPresetInfo()) {
            final info = response.presetInfo;
            final uuid = Uuid.unparse(info.id);
            
            if (info.mode == 0) {
              _streamController.add(TransportEventScheduleUpdated(uuid, info.details.elementAtOrNull(0) ?? 0, info.details.elementAtOrNull(1) ?? 0));
            } else {
              _streamController.add(TransportEventSelectionUpdated(uuid, info.details));
            }
            return;
          }

          print("Unexpected protobuf result received: $value");
        } catch (e) {
          print("Error parsing preset info: $e");
        }
      }
    );
    
    if (bleDevice != null) {
      _connectedDevice = bleDevice;
      _connectionStream.add(ConnectionEstablishedEvent());

      _deviceConnectedStream = bleDevice.connectedStream.listen(_onConnectedChanged);
    } else {
      _connectionStream.add(ConnectionFailedEvent());
    }
  }

  @override
  Future<void> disconnect() async {
    _connectedDevice?.disconnect();
  }

  @override
  Future<void> resumed() async {
    if (_connectedDevice != null) {
      final connected = await _connectedDevice!.isConnected;
      if (!connected) {
        _connectedDevice?.disconnect();
      }
    }
  }

  @override
  Future<Result<()>> bootstrap() async {
    if (!isSetup) {
      isSetup = true;
      
      UniversalBle.queueType = QueueType.global;
      UniversalBle.timeout = const Duration(seconds: 10);

      UniversalBle.availabilityStream.listen(_onAvailablityChanged);
      UniversalBle.scanStream.listen(_onDeviceFound);
    }

    if (_connectedDevice == null) {
      return Err(pberror.Error(generic: GenericError(title: "BLE Error", message: "No connected device", type: ErrorType.CONNECTION)));
    }

    return await super.bootstrap();
  }

  @override
  void sendEvent(TransportEvent event) {
    _streamController.add(event);
  }

  @override
  void updateContinue() => throw Exception("Updater not implemented");

  @override
  void updateCancel() => throw Exception("Updater not implemented");

  int _failedRequests = 0;
  @override
  Future<Result<Res>> handleWithResponse<Res>(Request request) async {

    void disconnectIfManyFailures() {
      if (_failedRequests > 2) {
        _connectedDevice?.disconnect();
        _connectedDevice = null;
        _failedRequests = 0;
      }
    }

    if (_connectedDevice == null) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(pberror.Error(generic: GenericError(title: "BLE Error", message: "Failed to parse request", type: ErrorType.WARNING)));
    }

    final responseBytes = await _connectedDevice?.writeWithResponse(request.writeToBuffer(), retry: true);
    if (responseBytes == null) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(pberror.Error(generic: GenericError(title: "BLE Error", message: "Empty response received", type: ErrorType.WARNING)));
    }

    try {
      final response = proto.Response.fromBuffer(responseBytes);

      if (response.hasError()) {
        _failedRequests ++;
        return Err(response.error);
      }

      final value = response.parse<Res>();
      _failedRequests = 0;
      return value;
    } on pb.InvalidProtocolBufferException catch (e) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(pberror.Error(generic: GenericError(title: "BLE Error", message: "Invalid response received", type: ErrorType.WARNING)));
    } catch (e) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(pberror.Error(generic: GenericError(title: "BLE Error", message: "Unexpected error occured", type: ErrorType.WARNING)));
    }
  }

  @override
  Future<void> dispose() async {
    _deviceConnectedStream?.cancel();
    
    return;
  }
}

Future<Transport> stubTransport() => Future.value(TransportBle());
Future<Transport> platformTransport() => Future.value(TransportBle());