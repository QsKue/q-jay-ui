import '../transport_events.dart';

UpdaterEvent? decodeUpdaterEvent(dynamic raw) {
  if (raw is! List || raw.length < 2) return null;
  
  final code = raw[0] as int;
  final data = (raw[1] as dynamic);

  if (code == 0) {
    return SetupStarted();
  }
  if (code == 1) {
    return ExternalFoundSimilar();
  }
  if (code == 2) {
    return LocalFoundSimilar();
  }
  if (code == 3) {
    return LocalFoundNewer();
  }
  if (code == 4) {
    return FetchingUserData();
  }
  if (code == 5) {
    return ParsingData();
  }
  if (code == 6) {
    return FetchingSongs(data as double);
  }
  if (code == 7) {
    return DatabaseSetup();
  }
  if (code == 8) {
    return CleanupSongs();
  }
  if (code == 9) {
    return SetupComplete();
  }
  if (code == 100) {
    return SetupError(data as String);
  }

  return null;
}