
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;
import 'package:qjay/models/common.dart';

typedef QJayPlayer = ffi.Pointer<ffi.Void>;
typedef NativeString = ffi.Pointer<ffi.Utf8>;
typedef NativeStringOut = ffi.Pointer<NativeString>;
typedef ErrorString = ffi.Pointer<NativeString>;

class QJayFFI {

  final ffi.DynamicLibrary _lib;

  QJayFFI() : _lib = _openLibrary();

  static ffi.DynamicLibrary _openLibrary() {
    if (Platform.isLinux) {
      final exeDir = File(Platform.resolvedExecutable).parent.path;
      return ffi.DynamicLibrary.open("$exeDir/lib/libqjay.so");
    } else if (Platform.isMacOS) {
      return ffi.DynamicLibrary.open('libqjay.dylib');
    } else if (Platform.isWindows) {
      return ffi.DynamicLibrary.open('qjay.dll');
    }
    throw UnsupportedError('Unsupported platform');
  }

  String? _takeError(ErrorString errOut) {
    final errPtr = errOut.value;
    if (errPtr == ffi.nullptr) return null;
    final msg = errPtr.cast<ffi.Utf8>().toDartString();
    _freeCStr(errPtr);
    return msg.isEmpty ? null : msg;
  }

  late final void Function(ffi.Pointer<ffi.NativeFunction<ffi.Int8 Function(ffi.Int64, ffi.Pointer<ffi.Void>)>>) storeDartPostCObject =
    _lib.lookupFunction<
      ffi.Void Function(ffi.Pointer<ffi.NativeFunction<ffi.Int8 Function(ffi.Int64, ffi.Pointer<ffi.Void>)>>),
      void Function(ffi.Pointer<ffi.NativeFunction<ffi.Int8 Function(ffi.Int64, ffi.Pointer<ffi.Void>)>>)
    >('qjay_store_dart_post_cobject');

  bool _dartApiInstalled = false;
  void _installDartApiIfNeeded() {
    if (_dartApiInstalled) return;
    storeDartPostCObject(ffi.NativeApi.postCObject as ffi.Pointer<ffi.NativeFunction<ffi.Int8 Function(ffi.Int64 p1, ffi.Pointer<ffi.Void> p2)>>);
    _dartApiInstalled = true;
  }

  late final void Function(QJayPlayer) beginCaptureEvents =
    _lib.lookupFunction<
      ffi.Void Function(QJayPlayer),
      void Function(QJayPlayer)
    >('qjay_begin_capture_events');

  late final QJayPlayer Function(int, ErrorString) _init =
    _lib.lookupFunction<
      QJayPlayer Function(ffi.Int64, ErrorString),
      QJayPlayer Function(int, ErrorString)
    >('qjay_init');

  QJayPlayer init(int isolatePort) {
    _installDartApiIfNeeded();
    
    final errOut = ffi.calloc<NativeString>();
    try {
      final handle = _init(isolatePort, errOut);
      final err = _takeError(errOut);
      if (err != null) {
        throw Exception('init failed: $err');
      }
      if (handle == ffi.nullptr) {
        throw Exception('init returned null handle');
      }
      return handle;
    } finally {
      ffi.calloc.free(errOut);
    }
  }

  late final int Function(QJayPlayer, NativeString, NativeString, ErrorString) _setup =
    _lib.lookupFunction<
      ffi.UintPtr Function(QJayPlayer, NativeString, NativeString, ErrorString),
      int Function(QJayPlayer, NativeString, NativeString, ErrorString)
    >('qjay_setup');

  Result<()> setup(QJayPlayer handle, {required String dbPath, required String songDir}) {
    final db = dbPath.toNativeUtf8();
    final dir = songDir.toNativeUtf8();
    final errOut = ffi.calloc<NativeString>();
    try {
      final code = _setup(handle, db.cast(), dir.cast(), errOut);
      final err = _takeError(errOut);
      
      if (code == 0) {
        return Ok(());
      }
      
      return Ok(());
    } finally {
      ffi.calloc.free(db);
      ffi.calloc.free(dir);
      ffi.calloc.free(errOut);
    }
  }

  late final int Function(QJayPlayer, NativeString, NativeString, NativeString, NativeString, ErrorString) _setupClient =
    _lib.lookupFunction<
      ffi.UintPtr Function(QJayPlayer, NativeString, NativeString, NativeString, NativeString, ErrorString),
      int Function(QJayPlayer, NativeString, NativeString, NativeString, NativeString, ErrorString)
    >('qjay_setup_client');

  int setupClient(QJayPlayer handle, String dbPath, String songDir, String id, String name) {
    final db = dbPath.toNativeUtf8();
    final dir = songDir.toNativeUtf8();
    final cid = id.toNativeUtf8();
    final cname = name.toNativeUtf8();
    final errOut = ffi.calloc<NativeString>();
    try {
      final code = _setupClient(handle, db.cast(), dir.cast(), cid.cast(), cname.cast(), errOut);
      final err = _takeError(errOut);
      if (err != null) {
        throw Exception('qjay_setup_client failed: $err');
      }
      return code;
    } finally {
      ffi.calloc.free(db);
      ffi.calloc.free(dir);
      ffi.calloc.free(cid);
      ffi.calloc.free(cname);
      ffi.calloc.free(errOut);
    }
  }

  late final int Function(QJayPlayer, NativeString, NativeString, int, ErrorString) _setupWithUpdate =
    _lib.lookupFunction< 
      ffi.UintPtr Function(QJayPlayer, NativeString, NativeString, ffi.Int64, ErrorString),
      int Function(QJayPlayer, NativeString, NativeString, int, ErrorString)
    >('qjay_setup_with_update');

  int setupWithUpdate(QJayPlayer handle, String dbPath, String songDir, int port) {
    final db = dbPath.toNativeUtf8();
    final dir = songDir.toNativeUtf8();
    final errOut = ffi.calloc<NativeString>();

    try {
      final code = _setupWithUpdate(handle, db.cast(), dir.cast(), port, errOut);
      final err = _takeError(errOut);
      if (err != null) {
        throw Exception('qjay_setup_client failed: $err');
      }
      return code;
    } finally {
      ffi.calloc.free(db);
      ffi.calloc.free(dir);
      ffi.calloc.free(errOut);
    }
  }

  late final int Function(QJayPlayer) updateContinue =
    _lib.lookupFunction<
      ffi.UintPtr Function(QJayPlayer),
      int Function(QJayPlayer)
    >('qjay_update_continue');

  late final int Function(QJayPlayer) updateCancel =
    _lib.lookupFunction<
      ffi.UintPtr Function(QJayPlayer),
      int Function(QJayPlayer)
    >('qjay_update_cancel');

  late final int Function(QJayPlayer, ffi.Pointer<ffi.Uint8>, int, ffi.Pointer<ffi.Pointer<ffi.Uint8>>, ffi.Pointer<ffi.UintPtr>, ErrorString) _requestWithResponse =
    _lib.lookupFunction<
      ffi.Size Function(QJayPlayer, ffi.Pointer<ffi.Uint8>, ffi.Size, ffi.Pointer<ffi.Pointer<ffi.Uint8>>, ffi.Pointer<ffi.UintPtr>, ErrorString),
      int Function(QJayPlayer, ffi.Pointer<ffi.Uint8>, int, ffi.Pointer<ffi.Pointer<ffi.Uint8>>, ffi.Pointer<ffi.UintPtr>, ErrorString)
    >('qjay_request_with_response');

  late final int Function(QJayPlayer, ErrorString) _setupPlayer =
      _lib.lookupFunction<
        ffi.Size Function(QJayPlayer, ErrorString),
        int Function(QJayPlayer, ErrorString)
      >('qjay_setup_player');

  int setupPlayer(QJayPlayer handle) {
    final errOut = ffi.calloc<NativeString>();
    try {
      final code = _setupPlayer(handle, errOut);
      final err = _takeError(errOut);
      if (err != null) {
        throw Exception('qjay_setup_player failed: $err');
      }
      return code;
    } finally {
      ffi.calloc.free(errOut);
    }
  }

  Uint8List requestWithResponseBytes(QJayPlayer handle, Uint8List requestBytes) {
    final inPtr  = ffi.calloc<ffi.Uint8>(requestBytes.length);
    final outPtr = ffi.calloc<ffi.Pointer<ffi.Uint8>>();
    final outLen = ffi.calloc<ffi.UintPtr>();
    final errOut = ffi.calloc<NativeString>();
    try {

      inPtr.asTypedList(requestBytes.length).setAll(0, requestBytes);

      outPtr.value = ffi.nullptr;
      outLen.value = 0;

      final code = _requestWithResponse(handle, inPtr, requestBytes.length, outPtr, outLen, errOut);

      final err = _takeError(errOut);
      if (code != 0 || err != null) {
        throw Exception('qjay_request_with_response failed ($code): ${err ?? ""}');
      }

      final ptr = outPtr.value;
      final len = outLen.value;
      if (ptr == ffi.nullptr || len == 0) {
        return Uint8List(0);
      }

      final bytes = Uint8List.fromList(ptr.asTypedList(len));
      _freeArray(ptr.cast<ffi.Void>(), len);
      return bytes;
    } finally {
      ffi.calloc.free(inPtr);
      ffi.calloc.free(outPtr);
      ffi.calloc.free(outLen);
      ffi.calloc.free(errOut);
    }
  }

  late final void Function(QJayPlayer) free =
    _lib.lookupFunction<
      ffi.Void Function(QJayPlayer),
      void Function(QJayPlayer)
    >('qjay_free');

  late final void Function(ffi.Pointer<ffi.Void>, int) _freeArray =
    _lib.lookupFunction<
      ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.UintPtr),
      void Function(ffi.Pointer<ffi.Void>, int)
    >('qlib_free_array');

  late final void Function(NativeString) _freeCStr =
    _lib.lookupFunction<
      ffi.Void Function(NativeString),
      void Function(NativeString)
    >('qlib_free_cstr');
}