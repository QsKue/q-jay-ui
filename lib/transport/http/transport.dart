// Generated with ChatGPT along mdns

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:protobuf/protobuf.dart' as pb;
import 'package:qjay/models/response.dart';
import 'package:qjay/transport/proto/request.pb.dart';
import 'package:qjay/transport/transport.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:qjay/models/common.dart';
import 'package:qjay/models/request.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;
import 'package:qjay/transport/proto/error.pb.dart' show GenericError;
import 'package:qjay/transport/proto/error.pbenum.dart';
import 'package:qjay/transport/proto/response.pb.dart' as proto;
import 'package:qjay/transport/transport_dynamic.dart';
import 'package:qjay/transport/transport_events.dart';

import 'mdns.dart';

class TransportHttp extends TransportDynamic {
  @override bool get isMock => false;

  final _client = http.Client();

  InternetAddress? _addr;
  int? _port;

  Uri get _httpRequestUri => Uri.parse('http://${_addr!.address}:${_port!}/request');
  Uri get _wsListenerUri => Uri.parse('ws://${_addr!.address}:${_port!}/listener');

  final _connectionStream = StreamController<ConnectionEvent>.broadcast();
  @override Stream<ConnectionEvent> get connectionStream => _connectionStream.stream;

  final _updaterStream = StreamController<UpdaterEvent>.broadcast();
  @override Stream<UpdaterEvent> get updaterStream => _updaterStream.stream;

  final _eventStream = StreamController<TransportEvent>.broadcast();
  @override Stream<TransportEvent> get eventStream => _eventStream.stream;

  WebSocketChannel? _ws;
  StreamSubscription? _wsSub;

  bool _connecting = false;

  static const int _wsPlayerState = 1;
  static const int _wsPlayerProgress = 2;
  static const int _wsCurrentSong = 3;
  static const int _wsEvent = 4;

  @override
  Future<void> scan() async {
    final connectionResult = await Connectivity().checkConnectivity();
    if (!connectionResult.contains(ConnectivityResult.wifi)) {
      _connectionStream.add(ConnectionDisabledEvent());
      return;
    }

    _connectionStream.add(ConnectionScanningEvent());
    
    try {
      final found = await MdnsQjayDiscovery.discover(timeout: const Duration(seconds: 8));
      if (found == null) {
        _connectionStream.add(ConnectionNotFoundEvent());
        return;
      }

      _addr = found.address;
      _port = found.port;
      
      await connect();
    } catch (e) {
      _connectionStream.add(ConnectionNotFoundEvent());
      return;
    }
  }

  @override
  Future<void> connect() async {
    if (_connecting) return;

    if (_addr == null || _port == null) {
      _connectionStream.add(ConnectionNotFoundEvent());
      return;
    }

    if (_ws != null) return;

    _connecting = true;
    _connectionStream.add(ConnectionConnectingEvent());

    try {
      final ws = WebSocketChannel.connect(_wsListenerUri);
      _ws = ws;
      
      _wsSub = ws.stream.listen(
        (dynamic data) {
          if (data is Uint8List) {
            _handleWsBytes(data);
          } else if (data is List<int>) {
            _handleWsBytes(Uint8List.fromList(data));
          }
        },
        onDone: () {
          _cleanupWs();
          _connectionStream.add(ConnectionDisconnectedEvent());
        },
        onError: (_) {
          _cleanupWs();
          _connectionStream.add(ConnectionFailedEvent());
        },
        cancelOnError: true,
      );

      final ok = await _probeHttp();
      if (!ok) {
        await disconnect();
        _connectionStream.add(ConnectionFailedEvent());
        return;
      }

      _connectionStream.add(ConnectionEstablishedEvent());
    } catch (_) {
      _cleanupWs();
      _connectionStream.add(ConnectionFailedEvent());
    } finally {
      _connecting = false;
    }
  }

  Future<bool> _probeHttp() async {
    try {
      final resp = await _client
          .post(
            _httpRequestUri,
            headers: {'Content-Type': 'application/octet-stream'},
            body: const <int>[],
          )
          .timeout(const Duration(seconds: 2));

      return resp.statusCode == 400 || resp.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<Result<()>> bootstrap() async {
    return Ok(());
  }

  @override
  Future<void> disconnect() async {
    _cleanupWs();
    _connectionStream.add(ConnectionDisconnectedEvent());
  }

  @override
  Future<void> resumed() async {
    
  }

  @override
  void sendEvent(TransportEvent event) => _eventStream.add(event);

  @override
  void updateContinue() => throw Exception("Updater not implemented");
  @override
  void updateCancel() => throw Exception("Updater not implemented");

  int _failedRequests = 0;

  @override
  Future<Result<Res>> handleWithResponse<Res>(Request request) async {
    void disconnectIfManyFailures() {
      if (_failedRequests > 2) {
        _failedRequests = 0;
        disconnect();
      }
    }

    if (_ws == null || _addr == null || _port == null) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(
        pberror.Error(
          generic: GenericError(
            title: "HTTP Error",
            message: "Not connected",
            type: ErrorType.CONNECTION,
          ),
        ),
      );
    }

    try {
      final reqBytes = request.writeToBuffer();

      final resp = await _client
          .post(
            _httpRequestUri,
            headers: {
              'Content-Type': 'application/octet-stream',
              'Accept': 'application/octet-stream',
            },
            body: reqBytes,
          )
          .timeout(const Duration(seconds: 10));

      if (resp.statusCode != 200) {
        _failedRequests++;
        disconnectIfManyFailures();
        return Err(
          pberror.Error(
            generic: GenericError(
              title: "HTTP Error",
              message: "Bad status: ${resp.statusCode}",
              type: ErrorType.WARNING,
            ),
          ),
        );
      }

      final responseBytes = resp.bodyBytes;
      if (responseBytes.isEmpty) {
        _failedRequests++;
        disconnectIfManyFailures();
        return Err(
          pberror.Error(
            generic: GenericError(
              title: "HTTP Error",
              message: "Empty response received",
              type: ErrorType.WARNING,
            ),
          ),
        );
      }

      final protoResp = proto.Response.fromBuffer(responseBytes);

      if (protoResp.hasError()) {
        _failedRequests++;
        return Err(protoResp.error);
      }

      final parsed = protoResp.parse<Res>();
      _failedRequests = 0;
      return parsed;
    } on TimeoutException {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(
        pberror.Error(
          generic: GenericError(
            title: "HTTP Timeout",
            message: "Request timed out",
            type: ErrorType.WARNING,
          ),
        ),
      );
    } on pb.InvalidProtocolBufferException {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(
        pberror.Error(
          generic: GenericError(
            title: "HTTP Error",
            message: "Invalid protobuf response",
            type: ErrorType.WARNING,
          ),
        ),
      );
    } catch (e) {
      _failedRequests++;
      disconnectIfManyFailures();
      return Err(
        pberror.Error(
          generic: GenericError(
            title: "HTTP Error",
            message: "Unexpected error: $e",
            type: ErrorType.WARNING,
          ),
        ),
      );
    }
  }

  void _handleWsBytes(Uint8List bytes) {
    if (bytes.isEmpty) return;
    final kind = bytes[0];
    final payload = bytes.length > 1 ? bytes.sublist(1) : Uint8List(0);

    switch (kind) {
      case _wsPlayerState:
        if (payload.isEmpty) return;
        _eventStream.add(TransportEventStateUpdated(PlayerState.fromValue(payload[0])));
        return;

      case _wsPlayerProgress:
        if (payload.length < 4) return;
        final bd = ByteData.sublistView(payload);
        final progress = bd.getFloat32(0, Endian.little);
        _eventStream.add(
          TransportEventProgressUpdated(
            Duration(seconds: (1000 * progress).toInt()),
            const Duration(seconds: 1000),
          ),
        );
        return;

      case _wsCurrentSong:
        // reserved (your Rust HTTP runner doesn’t emit it yet)
        if (payload.length == 16) {
          final uuid = Uuid.unparse(payload);
          handleWithResponse<List<Song>>(ProtoRequest.getSong(uuid)).then((song) {
            switch (song) {
              case Ok<List<Song>>():
                if (song.value.isNotEmpty) {
                  _eventStream.add(TransportEventSongUpdated(song.value.first));
                }
              case Err<List<Song>>():
                break;
            }
          });
        }
        return;

      case _wsEvent:
        try {
          final response = proto.Response.fromBuffer(payload);

          if (response.hasError()) {
            _eventStream.add(TransportEventError(response.error));
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
              _eventStream.add(
                TransportEventScheduleUpdated(
                  uuid,
                  info.details.elementAtOrNull(0) ?? 0,
                  info.details.elementAtOrNull(1) ?? 0,
                ),
              );
            } else {
              _eventStream.add(TransportEventSelectionUpdated(uuid, info.details));
            }
            return;
          }
        } catch (_) {}
        return;

      default:
        return;
    }
  }

  void _cleanupWs() {
    _wsSub?.cancel();
    _wsSub = null;
    try {
      _ws?.sink.close();
    } catch (_) {}
    _ws = null;
  }

  @override
  Future<void> dispose() async {
    _cleanupWs();
    _client.close();
    await _connectionStream.close();
    await _updaterStream.close();
    await _eventStream.close();
  }
}

extension _ListNullSafe<T> on List<T> {
  T? elementAtOrNull(int i) => (i < 0 || i >= length) ? null : this[i];
}

Future<Transport> stubTransport() => Future.value(TransportHttp());
Future<Transport> platformTransport() => Future.value(TransportHttp());