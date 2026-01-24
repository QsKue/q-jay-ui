import 'package:flutter/foundation.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';

import 'transport_events.dart';
import 'transport_stub.dart'
  // if (dart.library.ffi) 'ffi/transport.dart'
  if (dart.library.io) 'transport_composite.dart'
  if (dart.library.html) 'transport_web.dart';

class TransportSelectionSongs {
  int startIndex;
  List<Song> songInfo;
  TransportSelectionSongs(this.startIndex, this.songInfo);
}

class TransportPresetList {
  int startIndex;
  List<Preset> presets;
  TransportPresetList(this.startIndex, this.presets);
}

class TransportScheduleRotationList {
  int startIndex;
  List<ScheduleRotation> rotationList;
  TransportScheduleRotationList(this.startIndex, this.rotationList);
}

abstract class Transport {
  bool get isMock => false;

  Stream<ConnectionEvent> get connectionStream;
  Stream<UpdaterEvent> get updaterStream;
  Stream<TransportEvent> get eventStream;

  Future<Result<()>> bootstrap();
  Future<void> scan();
  Future<void> connect();
  Future<void> disconnect();
  Future<void> resumed();
  void sendEvent(TransportEvent event);

  Future<Result<()>> setupClient(String userId, String userName);
  Future<Result<()>> setupWithUpdate();
  void updateContinue();
  void updateCancel();

  Future<Result<DateTime>> subscriptionStatus();
  Future<Result<()>> validateSubscriptionStatus();
  Future<Result<()>> addOfflineKey(String key);

  Future<Result<int>> getWifiNetworkCount();
  Future<Result<(List<String>, int)>> getWifiNetworks(int offset, int count);
  Future<Result<()>> connectToSsid(String ssid, String password);

  void clearRequests();

  Future<Result<int>> getPresetCount();
  Future<Result<TransportPresetList>> getPresets(int offset, int count);

  Future<Result<()>> setSchedule(String scheduleId);
  Future<Result<Schedule>> getSchedule(String id);
  Future<Result<TransportScheduleRotationList>> getScheduleRotations(String id, int offset, int count);

  Future<Result<()>> setSelection(String selectionId, String? startingSongId, List<int> energies, SongDuration songDuration);
  Future<Result<Selection>> getSelection(String id);
  Future<Result<int>> getSelectionCount(String selectionId, List<int> energies);
  Future<Result<TransportSelectionSongs>> getSelectionSongs(String selectionId, List<int> energies, SongSortMode sortMode, int offset, int count);

  Future<Result<()>> setupPlayer();
  Future<Result<()>> play();
  Future<Result<()>> stop();
  Future<Result<()>> pause();
  Future<Result<()>> next();
  Future<Result<()>> skipToSong(String songId);

  Future<Result<TransportEvent>> getCurrentPreset();
  Future<Result<Song>> getCurrentSong();
  Future<Result<PlayerState>> getCurrentState();
  Future<Result<double>> getVolume();

  Future<Result<()>> setProgress(double percentage);
  Future<Result<()>> setVolume(double volume);

  Future<Result<int>> searchResultCount(String query);
  Future<Result<TransportSelectionSongs>> searchResultSongs(String query, int offset, int count);

  Future<Result<()>> addToExceptions(String songId, bool skipToNext);
  Future<Result<()>> removeFromExceptions(String songId);

  Future<Result<int>> getPinnedCount();
  Future<Result<TransportSelectionSongs>> getPinnedSongs(int offset, int count);
  Future<Result<()>> addPinnedSong(int index, Song song);
  Future<Result<()>> reorderPinnedSongs(int from, int to);
  Future<Result<int>> deletePinnedSong(String id);

  Future<void> dispose();
}

Future<Transport> createTransport() => kDebugMode ? stubTransport() : platformTransport();