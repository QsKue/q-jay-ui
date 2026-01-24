import 'dart:async';

import 'package:qjay/models/common.dart';
import 'package:qjay/transport/ble/transport.dart';
import 'package:qjay/transport/http/transport.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_dynamic.dart';
import 'package:qjay/transport/transport_events.dart';

import 'proto/request.pb.dart';

class CompositeTransport extends TransportDynamic {
  @override bool get isMock => _activeTransport.isMock;

  CompositeTransport() {
    _activeTransport = _bleTransport;
    _wireStreams();
  }

  final TransportDynamic _bleTransport = TransportBle();
  final TransportDynamic _httpTransport = TransportHttp();

  late TransportDynamic _activeTransport;

  final _connectionStream = StreamController<ConnectionEvent>.broadcast();
  @override Stream<ConnectionEvent> get connectionStream => _connectionStream.stream;

  final _updaterStream = StreamController<UpdaterEvent>.broadcast();
  @override Stream<UpdaterEvent> get updaterStream => _updaterStream.stream;

  final _eventStream = StreamController<TransportEvent>.broadcast();
  @override Stream<TransportEvent> get eventStream => _eventStream.stream;

  StreamSubscription? _httpConnectionSub;
  StreamSubscription? _bleConnectionSub;
  StreamSubscription? _httpUpdateSub;
  StreamSubscription? _bleUpdateSub;
  StreamSubscription? _httpEventSub;
  StreamSubscription? _bleEventSub;

  void _wireStreams() {
    _httpConnectionSub = _httpTransport.connectionStream.listen((e) {
      if (e is ConnectionEstablishedEvent) {
        _activeTransport = _httpTransport;
      }

      if (e is ConnectionDisconnectedEvent) {
        _activeTransport = _bleTransport;
      }

      if (_activeTransport == _httpTransport) {
        _connectionStream.add(e);
      }
    });

    _bleConnectionSub = _bleTransport.connectionStream.listen((e) {
      if (_activeTransport == _bleTransport) {
        _connectionStream.add(e);
      }
    });

    _httpUpdateSub = _httpTransport.updaterStream.listen((e) {
      if (_activeTransport == _httpTransport) {
        _updaterStream.add(e);
      }
    });

    _bleUpdateSub = _bleTransport.updaterStream.listen((e) {
      if (_activeTransport == _bleTransport) {
        _updaterStream.add(e);
      }
    });

    _httpEventSub = _httpTransport.eventStream.listen((e) {
      if (_activeTransport == _httpTransport) {
        _eventStream.add(e);
      }
    });

    _bleEventSub = _bleTransport.eventStream.listen((e) {
      if (_activeTransport == _bleTransport) {
        _eventStream.add(e);
      }
    });
  }

  @override
  Future<Result<()>> bootstrap() async {
    final httpResult = await _httpTransport.bootstrap();
    final bleResult = await _bleTransport.bootstrap();

    if (httpResult != Ok(())) return httpResult;
    if (bleResult != Ok(())) return bleResult;

    return Ok(());
  }

  @override
  Future<void> scan() async {
    _httpTransport.scan();
    _bleTransport.scan();
  }

  @override
  Future<void> connect() async {
    _httpTransport.connect();
    _bleTransport.connect();
  }

  @override
  Future<void> disconnect() async {
    await _httpTransport.disconnect();
    await _bleTransport.disconnect();
  }

  @override
  Future<void> resumed() async {
    await _httpTransport.resumed();
    await _bleTransport.resumed();
  }

  @override
  void sendEvent(TransportEvent event) {
    _eventStream.add(event);
  }

  @override
  void updateContinue() {
    return _activeTransport.updateContinue();
  }

  @override
  void updateCancel() {
    return _activeTransport.updateCancel();
  }

  @override
  Future<Result<Res>> handleWithResponse<Res>(Request request) async {
    return _activeTransport.handleWithResponse<Res>(request);
  }

  @override
  Future<void> dispose() async {
    await disconnect();

    await _httpConnectionSub?.cancel();
    await _bleConnectionSub?.cancel();
    await _httpUpdateSub?.cancel();
    await _bleUpdateSub?.cancel();
    await _httpEventSub?.cancel();
    await _bleEventSub?.cancel();

    await _bleTransport.dispose();
    await _httpTransport.dispose();

    await _connectionStream.close();
    await _updaterStream.close();
    await _eventStream.close();
  }
}

Future<Transport> stubTransport() => Future.value(CompositeTransport());
Future<Transport> platformTransport() => Future.value(CompositeTransport());