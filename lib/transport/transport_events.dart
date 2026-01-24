import 'package:qjay/models/common.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;

sealed class ConnectionEvent {
  const ConnectionEvent();
}

class ConnectionScanningEvent extends ConnectionEvent {
  const ConnectionScanningEvent();
}

class ConnectionDisabledEvent extends ConnectionEvent {
  const ConnectionDisabledEvent();
}

class ConnectionUnsupportedEvent extends ConnectionEvent {
  const ConnectionUnsupportedEvent();
}

class ConnectionRetryEvent extends ConnectionEvent {
  const ConnectionRetryEvent();
}

class ConnectionNotFoundEvent extends ConnectionEvent {
  const ConnectionNotFoundEvent();
}

class ConnectionFoundEvent extends ConnectionEvent {
  const ConnectionFoundEvent();
}

class ConnectionUnauthorizedEvent extends ConnectionEvent {
  const ConnectionUnauthorizedEvent();
}

class ConnectionConnectingEvent extends ConnectionEvent {
  const ConnectionConnectingEvent();
}

class ConnectionEstablishedEvent extends ConnectionEvent {
  const ConnectionEstablishedEvent();
}

class ConnectionFailedEvent extends ConnectionEvent {
  const ConnectionFailedEvent();
}

class ConnectionDisconnectedEvent extends ConnectionEvent {
  const ConnectionDisconnectedEvent();
}

sealed class TransportEvent {
  const TransportEvent();
}

class SwitchToMockMode extends TransportEvent {
  const SwitchToMockMode();
}

class TransportEventScheduleUpdated extends TransportEvent {
  String scheduleId;
  int rotationIndex;
  int segmentIndex;
  TransportEventScheduleUpdated(this.scheduleId, this.rotationIndex, this.segmentIndex);
}

class TransportEventSelectionUpdated extends TransportEvent {
  String selectionId;
  List<int> energies;
  TransportEventSelectionUpdated(this.selectionId, this.energies);
}

class TransportEventSongUpdated extends TransportEvent {
  Song song;
  TransportEventSongUpdated(this.song);
}

class TransportEventSongPinnedUpdated extends TransportEvent {
  String songId;
  bool pinned;
  TransportEventSongPinnedUpdated(this.songId, this.pinned);
}

class TransportEventSongBannedUpdated extends TransportEvent {
  String songId;
  bool banned;
  TransportEventSongBannedUpdated(this.songId, this.banned);
}

class TransportEventStateUpdated extends TransportEvent {
  PlayerState state;
  TransportEventStateUpdated(this.state);
}

class TransportEventProgressUpdated extends TransportEvent {
  Duration runningTime;
  Duration remainingTime;
  TransportEventProgressUpdated(this.runningTime, this.remainingTime);
}

class TransportEventError extends TransportEvent {
  pberror.Error error;
  TransportEventError(this.error);
}

// Onboarding
sealed class UpdaterEvent {
  const UpdaterEvent();
}

final class SetupStarted extends UpdaterEvent {
  const SetupStarted();
}

final class ExternalFoundSimilar extends UpdaterEvent {
  const ExternalFoundSimilar();
}

final class LocalFoundSimilar extends UpdaterEvent {
  const LocalFoundSimilar();
}

final class LocalFoundNewer extends UpdaterEvent {
  const LocalFoundNewer();
}

final class FetchingUserData extends UpdaterEvent {
  const FetchingUserData();
}

final class ParsingData extends UpdaterEvent {
  const ParsingData();
}

final class FetchingSongs extends UpdaterEvent {
  const FetchingSongs(this.progress);
  final double progress;
}

final class DatabaseSetup extends UpdaterEvent {
  const DatabaseSetup();
}

final class CleanupSongs extends UpdaterEvent {
  const CleanupSongs();
}

final class SetupComplete extends UpdaterEvent {
  const SetupComplete();
}

final class SetupError extends UpdaterEvent {
  const SetupError(this.message);
  final String message;
}