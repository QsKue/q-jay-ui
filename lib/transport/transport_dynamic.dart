import 'dart:async';
import 'dart:collection';
import 'dart:convert' show utf8;
import 'dart:math' show Random;
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/request.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;
import 'package:qjay/transport/proto/error.pb.dart' show GenericError;
import 'package:qjay/transport/proto/error.pbenum.dart';
import 'package:qjay/transport/proto/remote.pb.dart' show PresetInfo;
import 'package:qjay/transport/proto/request.pb.dart';
import 'package:qjay/transport/proto/response.pb.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:uuid/uuid.dart';

import 'transport.dart';

class _Job {
  _Job({ required this.run, required this.cancel });
  final Future<void> Function() run;
  final void Function() cancel;
}

abstract class TransportDynamic implements Transport {

  final _highPriorityQueue = Queue<_Job>();
  final _lowPriorityQueue = Queue<_Job>();
  bool _runningFalse = false;

  Future<Result<Res>> _queueWithPriority<Res>(Request request, [bool highPriority = false]) {
    final completer = Completer<Result<Res>>();

    (highPriority ? _highPriorityQueue : _lowPriorityQueue).add(
      _Job(
        run: () async {
          try {
            final result = await handleWithResponse<Res>(request);

            switch (result) {
              case Ok<Res>():
                break;
              case Err<Res>():
                print("Error occured: $request \n $result \n ${result.error}");
            }

            completer.complete(result);
          } catch (e) {
            completer.complete(Err(pberror.Error(generic: GenericError(title: "Request Canceled", type: ErrorType.IGNORED))));
          }
        },
        cancel: () async {
          completer.complete(Err(pberror.Error(generic: GenericError(title: "Request Canceled", type: ErrorType.IGNORED))));
        }
      )
    );
    
    _pump();
    return completer.future;
  }

  void _pump() {
    if (_runningFalse) return;
    _runningFalse = true;
    _drain();
  }

  Future<void> _drain() async {
    try {
      while (_highPriorityQueue.isNotEmpty || _lowPriorityQueue.isNotEmpty) {
        final job = _highPriorityQueue.isNotEmpty ? _highPriorityQueue.removeFirst() : _lowPriorityQueue.removeFirst();

        await job.run();
      }
    } finally {
      _runningFalse = false;

      if (_highPriorityQueue.isNotEmpty || _lowPriorityQueue.isNotEmpty) _pump();
    }
  }

  Future<Result<Res>> handleWithResponse<Res>(Request request);

  @override
  Future<Result<()>> bootstrap() => _queueWithPriority(ProtoRequest.setupRuntime());

  @override
  Future<Result<()>> setupClient(String userId, String userName) => _queueWithPriority(ProtoRequest.setupClient(userId, userName), true);

  @override
  Future<Result<DateTime>> subscriptionStatus() => _queueWithPriority(ProtoRequest.subscriptionStatus());

  @override
  Future<Result<()>> validateSubscriptionStatus() => _queueWithPriority(ProtoRequest.validateSubscription(), true);

  @override
  Future<Result<()>> addOfflineKey(String key) => _queueWithPriority(ProtoRequest.addOfflineKey(key), true);

  @override
  Future<Result<()>> setupWithUpdate() => _queueWithPriority(ProtoRequest.setupWithUpdate(), true);

  @override
  void clearRequests() async {
    for (final b in _highPriorityQueue){
      b.cancel();
    }
    for (final b in _lowPriorityQueue) {
      b.cancel();
    }

    _highPriorityQueue.clear();
    _lowPriorityQueue.clear();
    _runningFalse = false;
  }

  @override
  Future<Result<int>> getWifiNetworkCount() => _queueWithPriority(ProtoRequest.getWifiNetworkCount());

  @override
  Future<Result<(List<String>, int)>> getWifiNetworks(int offset, int count) async {
    final result = await _queueWithPriority<WifiNetworkList>(ProtoRequest.getWifiNetworks(offset, count));
    switch (result) {
      case Ok<WifiNetworkList>():
        return Ok((result.value.items, result.value.activeIndex));
      case Err<WifiNetworkList>():
        return Err(result.error);
    }
  }

  @override
  Future<Result<()>> connectToSsid(String ssid, String password) async {
    final aesKey = <int>[
      0xae, 0xd3, 0x4c, 0x92, 0x31, 0x7f, 0x55, 0x8a,0x4b, 0x01, 0x9f, 0xd7, 0x6c, 0x42, 0x8e, 0xb9,
      0x3c, 0xbf, 0x8d, 0x21, 0xf4, 0x77, 0x0b, 0x6e, 0x0d, 0xa1, 0xf3, 0x89, 0x52, 0xc7, 0x14, 0xee,
    ];

    final random = Random.secure();
    Uint8List randomBytes(int length) {
      final bytes = Uint8List(length);
      for (var i = 0; i < length; i++) {
        bytes[i] = random.nextInt(256);
      }
      return bytes;
    }
    
    final algorithm = AesGcm.with256bits();
    final secretKey = SecretKey(aesKey);
    final nonce = randomBytes(12);

    final secretBox = await algorithm.encrypt(
      utf8.encode(password),
      secretKey: secretKey,
      nonce: nonce,
    );

    final macBytes = secretBox.mac.bytes;
    final cipherText = secretBox.cipherText;

    final cipherWithMac = Uint8List(cipherText.length + macBytes.length);
    cipherWithMac.setRange(0, cipherText.length, cipherText);
    cipherWithMac.setRange(cipherText.length, cipherWithMac.length, macBytes);

    return await _queueWithPriority(ProtoRequest.connectToSsid(ssid, cipherWithMac, secretBox.nonce));
  }

  @override
  Future<Result<int>> getPresetCount() => _queueWithPriority(ProtoRequest.getPresetCount());

  @override
  Future<Result<TransportPresetList>> getPresets(int offset, int count) async
    => _presetListResultOrNull(offset, await _queueWithPriority(ProtoRequest.getPresets(offset, count)));

  @override
  Future<Result<Schedule>> getSchedule(String id) => _queueWithPriority(ProtoRequest.getSchedule(id));

  @override
  Future<Result<TransportScheduleRotationList>> getScheduleRotations(String id, int offset, int count) async
    => _scheduleRotationsResultOrNull(offset, await _queueWithPriority(ProtoRequest.getScheduleRotations(id, offset, count)));

  @override
  Future<Result<()>> setSchedule(String scheduleId) => _queueWithPriority(ProtoRequest.setSchedule(scheduleId), true);

  @override
  Future<Result<Selection>> getSelection(String selectionId) => _queueWithPriority(ProtoRequest.getSelection(selectionId));

  @override
  Future<Result<int>> getSelectionCount(String selectionId, List<int> energies) => _queueWithPriority(ProtoRequest.getSelectionCount(selectionId, energies), true);

  @override
  Future<Result<TransportSelectionSongs>> getSelectionSongs(String selectionId, List<int> energies, SongSortMode sortMode, int offset, int count) async
    => _songListResultOrNull(offset, await _queueWithPriority(ProtoRequest.getSelectionSongs(selectionId, energies, sortMode, offset, count)));

  @override
  Future<Result<()>> setSelection(String selectionId, String? startingSongId, List<int> energies, SongDuration songDuration) 
    => _queueWithPriority(ProtoRequest.setSelection(selectionId, startingSongId, energies, songDuration), true);

  @override
  Future<Result<()>> setupPlayer() => _queueWithPriority(ProtoRequest.setupPlayer(), true);

  @override
  Future<Result<()>> play() => _queueWithPriority(ProtoRequest.play(), true);

  @override
  Future<Result<()>> stop() => _queueWithPriority(ProtoRequest.stop(), true);

  @override
  Future<Result<()>> pause() => _queueWithPriority(ProtoRequest.pause(), true);

  @override
  Future<Result<()>> next() => _queueWithPriority(ProtoRequest.next(), true);

  @override
  Future<Result<()>> skipToSong(String songId) => _queueWithPriority(ProtoRequest.skipToSong(songId), true);

  @override
  Future<Result<TransportEvent>> getCurrentPreset() async {
    final result = await _queueWithPriority<PresetInfo>(ProtoRequest.getCurrentPreset(), true);
    switch(result) {
      case Ok<PresetInfo>():
        final uuid = Uuid.unparse(result.value.id);

        if (result.value.mode == 0) {
          return Ok(TransportEventScheduleUpdated(uuid, result.value.details.elementAtOrNull(0) ?? 0, result.value.details.elementAtOrNull(1) ?? 0));
        } else {
          return Ok(TransportEventSelectionUpdated(uuid, result.value.details));
        }
      case Err<PresetInfo>():
        return Err(result.error);
    }
  }

  @override
  Future<Result<Song>> getCurrentSong() async {
    final result = _songListResultOrNull(0, await _queueWithPriority(ProtoRequest.getCurrentSong(), true));
    switch (result) {
      case Ok<TransportSelectionSongs>():
        final song = result.value.songInfo.firstOrNull;
        if (song == null) {
          return Err(pberror.Error(generic: GenericError(title: "Runtime Error", message: "Current song is empty", type: ErrorType.WARNING)));
        }
        return Ok(song);
      case Err<TransportSelectionSongs>():
        return Err(result.error);
    }
  }

  @override
  Future<Result<PlayerState>> getCurrentState() async {
    final result = await _queueWithPriority<int>(ProtoRequest.getCurrentState(), true);
    switch (result) {
      case Ok<int>():
        return Ok(PlayerState.fromValue(result.value));
      case Err<int>():
        return Err(result.error);
    }
  }

  @override
  Future<Result<double>> getVolume() => _queueWithPriority(ProtoRequest.getVolume());

  @override
  Future<Result<()>> setProgress(double percentage) => _queueWithPriority(ProtoRequest.setProgress(percentage), true);

  @override
  Future<Result<()>> setVolume(double volume) => _queueWithPriority(ProtoRequest.setVolume(volume), true);

  @override
  Future<Result<int>> searchResultCount(String query) => _queueWithPriority(ProtoRequest.searchResultCount(query), true);

  @override
  Future<Result<TransportSelectionSongs>> searchResultSongs(String query, int offset, int count) async
    => _songListResultOrNull(offset, await _queueWithPriority(ProtoRequest.searchResultSongs(query, offset, count)));

  @override
  Future<Result<()>> addToExceptions(String songId, bool skipToNext) => _queueWithPriority(ProtoRequest.addToExceptions(songId, skipToNext), true);

  @override
  Future<Result<()>> removeFromExceptions(String songId) => _queueWithPriority(ProtoRequest.removeFromExceptions(songId));

  @override
  Future<Result<int>> getPinnedCount() => _queueWithPriority(ProtoRequest.getPinnedCount());

  @override
  Future<Result<TransportSelectionSongs>> getPinnedSongs(int offset, int count) async
    => _songListResultOrNull(offset, await _queueWithPriority(ProtoRequest.getPinnedSongs(offset, count)));

  @override
  Future<Result<()>> addPinnedSong(int index, Song song) => _queueWithPriority(ProtoRequest.addPinnedSong(index, song.id), true);

  @override
  Future<Result<int>> deletePinnedSong(String id) => _queueWithPriority(ProtoRequest.deletePinnedSong(id));

  @override
  Future<Result<()>> reorderPinnedSongs(int from, int to) => _queueWithPriority(ProtoRequest.reorderPinnedSongs(from, to));

  Result<TransportPresetList> _presetListResultOrNull(int offset, Result<List<Preset>> result) {
    switch (result) {
      case Ok<List<Preset>>():
        return Ok(TransportPresetList(offset, result.value));
      case Err<List<Preset>>():
        return Err(result.error);
    }
  }

  Result<TransportScheduleRotationList> _scheduleRotationsResultOrNull(int offset, Result<List<ScheduleRotation>> result) {
    switch (result) {
      case Ok<List<ScheduleRotation>>():
        return Ok(TransportScheduleRotationList(offset, result.value));
      case Err<List<ScheduleRotation>>():
        return Err(result.error);
    }
  }

  Result<TransportSelectionSongs> _songListResultOrNull(int offset, Result<List<Song>> result) {
    switch (result) {
      case Ok<List<Song>>():
        return Ok(TransportSelectionSongs(offset, result.value));
      case Err<List<Song>>():
        return Err(result.error);
    }
  }
}