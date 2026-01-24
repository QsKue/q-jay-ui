import 'dart:ffi' as ffi;
import 'dart:isolate';

import 'ffi.dart';

import 'package:qjay/transport/proto/request.pb.dart';

enum IsolateCalls {
  bootstrap,
  beginCaptureEvents,
  setupClient, setupWithUpdate,
  updateContinue, updateCancel,
  responseForRequest,
  dispose,
}

void qjayWorkerEntry(SendPort initSendPort) {
  final rpcRx = ReceivePort();
  initSendPort.send(rpcRx.sendPort);

  final qjay = QJayFFI();

  final nativeEventsRx = RawReceivePort();
  SendPort? eventPortToMain;

  nativeEventsRx.handler = (msg) {
    final p = eventPortToMain;
    if (p != null) p.send(msg);
  };

  ffi.Pointer<ffi.Void>? handle;

  rpcRx.listen((message) {
    if (message is String && message == 'shutdown') {
      try { if (handle != null && handle != ffi.nullptr) qjay.free(handle!); } catch (_) {}
      nativeEventsRx.close();
      rpcRx.close();
      return;
    }

    final (int id, IsolateCalls call, Object? params, SendPort reply) = message as (int, IsolateCalls, Object?, SendPort);

    void ok([Object? v]) => reply.send((id, true, v));
    void err(Object e) => reply.send((id, false, e.toString()));

    dynamic result;

    try {
      switch (call) {
        case IsolateCalls.bootstrap:
          handle = qjay.init(nativeEventsRx.sendPort.nativePort);
          final setupResult = qjay.setup(handle!, dbPath: "/home/kue.bak/Test/mstr.cdb", songDir: "/home/kue.bak/Test/Data");
          
          if (setupResult.isOk) {
            qjay.setupPlayer(handle!);
          }

          result = setupResult;
          break;
        case IsolateCalls.beginCaptureEvents:
          if ((handle != null) && (eventPortToMain == null)) {
            eventPortToMain = params as SendPort;
            qjay.beginCaptureEvents(handle!);
          }
          break;
        case IsolateCalls.setupClient:
          if (handle != null) {
            final name = params as String;
            qjay.setupClient(handle!, "/home/kue.bak/Test/mstr.cdb", "/home/kue.bak/Test/Data", "2", name);
          }
          break;
        case IsolateCalls.setupWithUpdate:
          if (handle != null) {
            final port = params as SendPort;
            qjay.setupWithUpdate(handle!, "/home/kue.bak/Test/mstr.cdb", "/home/kue.bak/Test/Data", port.nativePort);
          }
          break;
        case IsolateCalls.updateContinue:
          if (handle != null) {
            qjay.updateContinue(handle!);
          }
          break;
        case IsolateCalls.updateCancel:
          if (handle != null) {
            qjay.updateCancel(handle!);
          }
          break;
        case IsolateCalls.responseForRequest:
          if (handle != null) {
            final request = params as Request;
            result = qjay.requestWithResponseBytes(handle!, request.writeToBuffer());
          }
          break;
        case IsolateCalls.dispose:
          break;
      }
    } catch (e) {
      err(e);
    }

    ok(result);
  });
}
