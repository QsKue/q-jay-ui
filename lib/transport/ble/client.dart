
import 'dart:async';
import 'dart:typed_data';

import 'package:universal_ble/universal_ble.dart';

extension IterableIndexOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    final index = indexWhere(test);
    return index == -1 ? null : this[index];
  }
}

const String qjayServiceUuid = "1b229bc2-2e3d-40c3-853a-4396628d9b45";
const String qjayRequestCharUuid = "98d2e58f-89ba-4401-93a8-5a4f85b3292d";
const String qjayPlayerStateCharUuid = "3e54739f-7d17-4414-8332-8a2c4f613774";
const String qjayplayerProgressCharUuid = "ba40aabb-529f-42be-b08d-f27542672bb4";
const String qjayCurrentSongCharUuid = "76ff234c-a3a0-4995-afa2-923ad2093a78";
const String qjayCurrentPresetCharUuid = "a6e041c2-87b6-46a4-879c-b09015dcfcb2";

class BleClient {
  Stream<bool> get connectedStream  => _bleDevice.connectionStream;
  Stream<bool> get pairedStream => _bleDevice.pairingStateStream;

  final BleDevice _bleDevice;
  // ignore: unused_field
  final BleService _bleService;

  final BleCharacteristic _requestCharacteristic;
  // ignore: unused_field
  final BleCharacteristic _playerStateCharacteristic;
  // ignore: unused_field
  final BleCharacteristic _playerProgressCharacteristic;
  // ignore: unused_field
  final BleCharacteristic _currentSongCharacteristic;
  // ignore: unused_field
  final BleCharacteristic _currentPresetCharacteristic;

  final StreamSubscription<Uint8List> _playerStateStream;
  final StreamSubscription<Uint8List> _playerProgressStream;
  final StreamSubscription<Uint8List> _currentSongStream;
  final StreamSubscription<Uint8List> _currentPresetStream;

  Future<bool> get isConnected => _bleDevice.isConnected;
  
  BleClient._({
    required BleDevice bleDevice,
    required BleService bleService,

    required BleCharacteristic requestCharacteristic,
    required BleCharacteristic playerStateCharacteristic,
    required BleCharacteristic playerProgressCharacteristic,
    required BleCharacteristic currentSongCharacteristic,
    required BleCharacteristic currentPresetCharacteristic,

    required StreamSubscription<Uint8List> playerStateStream,
    required StreamSubscription<Uint8List> playerProgressStream,
    required StreamSubscription<Uint8List> currentSongStream,
    required StreamSubscription<Uint8List> currentPresetStream,
  }) :
    _bleDevice = bleDevice,
    _bleService = bleService,
    _requestCharacteristic = requestCharacteristic,
    _playerStateCharacteristic = playerStateCharacteristic,
    _playerProgressCharacteristic = playerProgressCharacteristic,
    _currentSongCharacteristic = currentSongCharacteristic,
    _currentPresetCharacteristic = currentPresetCharacteristic,
    _playerStateStream = playerStateStream,
    _playerProgressStream = playerProgressStream,
    _currentSongStream = currentSongStream,
    _currentPresetStream = currentPresetStream;

  Future<Uint8List?> writeWithResponse<Res>(Uint8List requestBytes, { bool retry = false }) async {
    
    try {
      await _requestCharacteristic.write(requestBytes);
    } catch (e) {
      print("Error writing request");
      return retry ? await writeWithResponse(requestBytes, retry: false) : null;
    }

    try {
      final result =  await _requestCharacteristic.read();
      // return null;
      return result;
    } catch (e) {
      print("Error reading response");
      return retry ? await writeWithResponse(requestBytes, retry: false) : null;
    }
  }

  static Future<BleClient?> fromDevice({
    required BleDevice device,
    required void Function(Uint8List)? onPlayerStateUpdated,
    required void Function(Uint8List)? onPlayerProgressUpdated,
    required void Function(Uint8List)? onCurrentSongUpdated,
    required void Function(Uint8List)? onCurrentPresetUpdated,
    bool retry = false,
  }) async {
    Future<BleClient?> unpairAndRetry() async {
      // await device.unpair();
      return fromDevice(
        device: device,
        onCurrentSongUpdated: onCurrentSongUpdated,
        onPlayerProgressUpdated: onPlayerStateUpdated,
        onPlayerStateUpdated: onPlayerStateUpdated,
        onCurrentPresetUpdated: onCurrentPresetUpdated,
      );
    }

    final List<BleService> services;
    
    try {
      final isConnected = await device.isConnected;
      if (!isConnected) {
        await device.connect();
      }

      services = await device.discoverServices();
    } catch (e) {
      print("Failed to connect to device ${device.deviceId}");
      return null;
    }
    
    final service = services.firstWhereOrNull((service) => service.uuid == qjayServiceUuid);
    if (service == null) {
      print("Failed to find service $qjayServiceUuid");
      return null;
    }

    final requestCharacteristic = service.characteristics.firstWhereOrNull((characteristic) => characteristic.uuid == qjayRequestCharUuid);
    if (requestCharacteristic == null) {
      print("Failed to find request characteristic");
      return null;
    }

    final playerStateCharacteristicResult = await _subscribeToCharacteristic(service: service, uuid: qjayPlayerStateCharUuid, onData: onPlayerStateUpdated);
    if (playerStateCharacteristicResult == null) {
      print("Failed to subscribe to playerState");
      return retry ? unpairAndRetry() : null;
    }

    final (playerStateCharacteristic, playerStateStream) = playerStateCharacteristicResult;

    final playerProgressCharacteristicResult = await _subscribeToCharacteristic(service: service, uuid: qjayplayerProgressCharUuid, onData: onPlayerProgressUpdated);
    if (playerProgressCharacteristicResult == null) {
      print("Failed to subscribe to playerProgress");
      playerStateStream.cancel();
      return retry ? unpairAndRetry() : null;
    }

    final (playerProgressCharacteristic, playerProgressStream) = playerProgressCharacteristicResult;

    final currentSongCharacteristicResult = await _subscribeToCharacteristic(service: service, uuid: qjayCurrentSongCharUuid, onData: onCurrentSongUpdated);
    if (currentSongCharacteristicResult == null) {
      print("Failed to subscribe to currentSong");
      playerStateStream.cancel();
      playerProgressStream.cancel();
      return retry ? unpairAndRetry() : null;
    }

    final (currentSongCharacteristic, currentSongStream) = currentSongCharacteristicResult;

    final currentPresetCharacteristicResult = await _subscribeToCharacteristic(service: service, uuid: qjayCurrentPresetCharUuid, onData: onCurrentPresetUpdated);
    if (currentPresetCharacteristicResult == null) {
      print("Failed to subscribe to currentPreset");
      currentSongStream.cancel();
      playerStateStream.cancel();
      playerProgressStream.cancel();
      return retry ? unpairAndRetry() : null;
    }

    final (currentPresetCharacteristic, currentPresetStream) = currentPresetCharacteristicResult;
    
    return BleClient._(
      bleDevice: device,
      bleService: service,

      requestCharacteristic: requestCharacteristic,
      playerStateCharacteristic: playerStateCharacteristic,
      playerProgressCharacteristic: playerProgressCharacteristic,
      currentSongCharacteristic: currentSongCharacteristic,
      currentPresetCharacteristic: currentPresetCharacteristic,

      playerStateStream: playerStateStream,
      playerProgressStream: playerProgressStream,
      currentSongStream: currentSongStream,
      currentPresetStream: currentPresetStream,
    );
  }

  static Future<(BleCharacteristic, StreamSubscription<Uint8List>)?> _subscribeToCharacteristic({
    required BleService service,
    required String uuid,
    required void Function(Uint8List)? onData,
  }) async {

    final characteristic = service.characteristics.firstWhereOrNull((characteristic) => characteristic.uuid == uuid);
    if (characteristic == null) {
      print("Failed to get request characteristic $uuid");
      return null;
    }

    var properties = characteristic.properties;
    if (!properties.contains(CharacteristicProperty.notify)) {
      print("Characteristic $uuid does not allow Notify");
      return null;
    }
    
    try {
      await characteristic.notifications.subscribe();
    } catch (e) {
      print("Failed to activate notify on $uuid");
      return null;
    }

    final streamSub = characteristic.onValueReceived.listen(onData);

    return (characteristic, streamSub);
  }

  void disconnect() {
    _bleDevice.disconnect();
    dispose();
  }

  void dispose() {
    _playerStateStream.cancel();
    _playerProgressStream.cancel();
    _currentSongStream.cancel();
    _currentPresetStream.cancel();
  }
}