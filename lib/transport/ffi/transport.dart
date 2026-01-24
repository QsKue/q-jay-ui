import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:protobuf/protobuf.dart' as pb;
import 'package:qjay/models/common.dart';
import 'package:qjay/models/response.dart';
import 'package:qjay/transport/proto/request.pb.dart';
import 'package:qjay/transport/proto/response.pb.dart' as proto;

import '../proto/error.pb.dart' as pberror;
import '../transport.dart';
import '../transport_dynamic.dart';
import '../transport_events.dart';
import 'event.dart';
import 'isolate.dart';

class QJayEvent {
  int jobId;
  Object data;
  QJayEvent(this.jobId, this.data);
}

class TransportFFI extends TransportDynamic {
  @override bool get isMock => false;

  static TransportFFI? _instance;
  
  static Future<TransportFFI> instance() async {
    if (_instance != null) return _instance!;
    await _initialize();
    return _instance!;
  }

  final SendPort _rpcSend;
  final ReceivePort _rpcRx;
  late final StreamSubscription _rpcSub;

  final ReceivePort _eventsRx;
  late final StreamSubscription _eventsSub;
  late final Stream<dynamic> _eventsBroadcast = _eventsStream.stream;
  late final StreamController<dynamic> _eventsStream = StreamController<dynamic>.broadcast();

  int _nextId = 0;
  final _pending = <int, Completer<Object?>>{};

  TransportFFI._(this._rpcSend, this._rpcRx, this._eventsRx) {
    _rpcSub = _rpcRx.listen(_onRpcResponse);

    _eventsSub = _eventsRx.listen(
      _eventsStream.add,
      onError: _eventsStream.addError,
      cancelOnError: true,
    );
  }

  static Future<void> _initialize() async {

    final initPort = ReceivePort();
    await Isolate.spawn(qjayWorkerEntry, initPort.sendPort);

    final SendPort workerRpcPort = await initPort.first as SendPort;
    final rpcResponses = ReceivePort();
    final nativeEvents = ReceivePort();

    final client = TransportFFI._(workerRpcPort, rpcResponses, nativeEvents);

    _instance = client;
  }

  Future<T> _send<T>(IsolateCalls call, [Object? params]) {
    final id = _nextId++;
    final c = Completer<T>.sync();
    _pending[id] = c as Completer<Object?>;
    _rpcSend.send((id, call, params, _rpcRx.sendPort));
    return c.future;
  }

  void _onRpcResponse(dynamic msg) {
    final (int id, bool ok, Object? payload) = msg as (int, bool, Object?);
    final c = _pending.remove(id);
    if (c == null) return;

    if (ok) {
      c.complete(payload);
    } else {
      c.completeError(StateError(payload?.toString() ?? 'native error'));
    }

    if (_pending.isEmpty && _closing) _rpcRx.close();
  }

  bool _closing = false;

  // local variables
  ReceivePort? _updaterRx;
  Stream<dynamic>? _updaterBroadcast;
  final _uodaterStream = StreamController<UpdaterEvent>.broadcast();
  @override Stream<UpdaterEvent> get updaterStream => _uodaterStream.stream;

  @override Stream<ConnectionEvent> get connectionStream => throw UnimplementedError();
  @override Future<void> scan() => Future.value();
  @override Future<void> connect() => Future.value();
  @override Future<void> disconnect() => Future.value();
  @override Future<void> resumed() => Future.value();

  @override
  Future<Result<()>> bootstrap() async {
    return _send<Result<()>>(IsolateCalls.bootstrap);
  }

  @override
  Stream<TransportEvent> get eventStream {
    throw "FIX THIS";
    _send<void>(IsolateCalls.beginCaptureEvents, _eventsRx.sendPort);
    
    return _eventsBroadcast
      .map(decodeTransportEvent)
      .where((e) => e != null)
      .cast<TransportEvent>();
  }

  @override
  void sendEvent(TransportEvent event) {
    if (!_eventsStream.isClosed) _eventsStream.add(event);
  }

  // @override
  // Stream<UpdaterEvent> setupClient({required String userName}) {
  //   _updaterRx?.close();
  //   _updaterRx = ReceivePort();
  //   _updaterBroadcast = _updaterRx!.asBroadcastStream();
    
  //   _send<void>(IsolateCalls.setupClient, userName);
  //   _send<void>(IsolateCalls.setupWithUpdate, _updaterRx!.sendPort);

  //   return _updaterBroadcast!
  //     .map(decodeUpdaterEvent)
  //     .where((e) => e != null)
  //     .cast<UpdaterEvent>();
  // }

  @override void updateCancel() => _send<void>(IsolateCalls.updateCancel);
  @override void updateContinue() => _send<void>(IsolateCalls.updateContinue);

  @override
  Future<Result<Res>> handleWithResponse<Res>(Request request) async {
    final bytes = await _send<Uint8List?>(IsolateCalls.responseForRequest, request);
    if (bytes == null) {
      return Err(pberror.Error(generic: pberror.GenericError(title: "Runtime Error", message: "Empty result received", type: pberror.ErrorType.WARNING)));
    }

    try {
      final response = proto.Response.fromBuffer(bytes);
      return response.parse<Res>();
    } on pb.InvalidProtocolBufferException catch (e) {
      return Err(pberror.Error(generic: pberror.GenericError(title: "Runtime Error", message: "Invalid data received", type: pberror.ErrorType.WARNING)));
    } catch (e) {
      return Err(pberror.Error(generic: pberror.GenericError(title: "Runtime Error", message: "Unexpected error occured", type: pberror.ErrorType.WARNING)));
    }
  }

  @override
  Future<void> dispose() async {
    try {
      await _send<void>(IsolateCalls.dispose);
    } finally {
      _closing = true;
      _rpcSend.send('shutdown');
      if (_pending.isEmpty) _rpcRx.close();
      _eventsRx.close();
      _eventsSub.cancel();
      _rpcSub.cancel();
      _eventsStream.close();
    }
  }
}

Future<Transport> stubTransport() => TransportFFI.instance();
Future<Transport> platformTransport() => TransportFFI.instance();