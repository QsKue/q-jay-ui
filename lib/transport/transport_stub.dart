import 'dart:async';

import 'package:qjay/models/common.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;

import 'transport_events.dart';
import 'transport.dart';

enum StubState { oboarding, connect, home }

class TransportStub implements Transport {
  @override bool get isMock => true;

  StubState state;
  TransportStub({ StubState? state }) : state = state ?? StubState.home {
    _eventTimer = Timer.periodic(Duration(milliseconds: 30), eventTimerCallback);
  }

  List<PresetType> activeFilters = [];

  bool isPlaying = false;
  Duration _runningTime = Duration.zero;
  final Duration _totalTime = Duration(seconds: 120);

  late final List<Preset> _presets = [
    ..._schedules.values,
    ..._selections.values
  ];

  late List<Song> _currentSongs = [];

  late final StreamController<ConnectionEvent> _connectionController = StreamController.broadcast();
  @override Stream<ConnectionEvent> get connectionStream => _connectionController.stream;

  late final _updaterStream = StreamController<UpdaterEvent>.broadcast();
  @override Stream<UpdaterEvent> get updaterStream => _updaterStream.stream;

  late final Timer _eventTimer;
  late final StreamController<TransportEvent> _eventController = StreamController.broadcast();
  @override Stream<TransportEvent> get eventStream => _eventController.stream;

  void eventTimerCallback(Timer timer) {
    if (isPlaying) {
      _runningTime += Duration(milliseconds: 30);
      _runningTime = _runningTime > _totalTime ? Duration.zero : _runningTime;
      _eventController.add(TransportEventProgressUpdated(_runningTime, _totalTime));

      if (_runningTime.inMilliseconds == 30 * 200) {
        _eventController.add(TransportEventError(pberror.Error(generic: pberror.GenericError(title: "MOCK Error", message: "Disconnect error", type: pberror.ErrorType.WARNING))));
      }
    }
  }

  void _onboardingMock() async {
    await Future.delayed(Duration(milliseconds: 200));
    _updaterStream.add(SetupStarted());
    
    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(FetchingUserData());

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(ParsingData());

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(FetchingSongs(0));

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(FetchingSongs(0.33));

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(FetchingSongs(0.66));

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(DatabaseSetup());

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(CleanupSongs());

    await Future.delayed(Duration(milliseconds: 400));
    _updaterStream.add(SetupComplete());

    state = StubState.home;
  }  

  @override Future<void> scan() async {
    _connectionController.add(ConnectionScanningEvent());

    await Future.delayed(Duration(milliseconds: 1000)); 
    _connectionController.add(ConnectionFoundEvent());

    connect();
  }
  
  @override Future<void> connect() async {
    _connectionController.add(ConnectionConnectingEvent());

    await Future.delayed(Duration(milliseconds: 2000)); 
    _connectionController.add(ConnectionEstablishedEvent());

    state = StubState.home;
  }

  @override
  Future<void> disconnect() async => ();

  @override
  Future<void> resumed() async => {};

  @override
  Future<Result<()>> bootstrap() async => switch (state) {
    StubState.oboarding => Err(pberror.Error(setup: pberror.SetupError(code: pberror.SetupErrorType.USER_SETUP))),
    StubState.connect => Err(pberror.Error(generic: pberror.GenericError(title: "MOCK Error", message: "Disconnected", type: pberror.ErrorType.CONNECTION))),
    StubState.home => Ok(()),
  };

  @override
  void sendEvent(TransportEvent event) {
    _eventController.add(event);
  }

  StreamController<UpdaterEvent>? _setupCtrl;

  @override
  Future<Result<()>> setupClient(String userId, String userName) async {
    _setupCtrl?.close();
    _setupCtrl = StreamController<UpdaterEvent>();

    () async {
      final s = _setupCtrl!;
      if (s.isClosed) return;
      s.add(const SetupStarted());

      await Future.delayed(const Duration(milliseconds: 400));
      if (s.isClosed) return;

      s.add(const FetchingUserData());
      await Future.delayed(const Duration(milliseconds: 600));

      if (s.isClosed) return;
      s.add(const ParsingData());

      await Future.delayed(const Duration(milliseconds: 400));
      for (var i = 0; i <= 20; i++) {
        await Future.delayed(const Duration(milliseconds: 120));
        final p = i / 20;

        if (s.isClosed) return;
        s.add(FetchingSongs(p));
      }

      if (s.isClosed) return;
      s.add(const DatabaseSetup());
      
      await Future.delayed(const Duration(milliseconds: 500));

      if (s.isClosed) return;
      s.add(const SetupComplete());
      
      await s.close();
    }();

    // return _setupCtrl!.stream;
    return Ok(());
  }

  @override Future<Result<()>> setupWithUpdate() async {
    _onboardingMock();
    return Ok(());
  }

  @override
  void updateContinue() {
    
  }

  @override
  void updateCancel() {
    if (!(_setupCtrl?.isClosed ?? true)) {
      _setupCtrl?.add(const SetupError('Cancelled by user'));
    }
    _setupCtrl?.close();
  }

  @override
  Future<Result<DateTime>> subscriptionStatus() async => Ok(DateTime.now().add(Duration(days: 30)));

  @override
  Future<Result<()>> validateSubscriptionStatus() async {
    return await Future.delayed(Duration(seconds: 1)).then((_) => Err(pberror.Error(subscriptionExpired: pberror.SubscriptionExpiredError(checked: false))));
  }

  @override
  Future<Result<()>> addOfflineKey(String key) async => Ok(());

  @override
  void clearRequests() {
    
  }

  @override
  Future<Result<int>> getWifiNetworkCount() async {
    return Ok(6);
  }

  @override
  Future<Result<(List<String>, int)>> getWifiNetworks(int offset, int count) async {
    return Future.delayed(Duration(seconds: 1)).then((_) => Ok((["BlinkA7736", "BlinkB992", "BlinkC222"], 0)));
  }

  @override
  Future<Result<()>> connectToSsid(String ssid, String password) async {
    return Ok(());
  }

  @override
  Future<Result<int>> getPresetCount() async {
    return Ok(_presets.length);
  }

  @override
  Future<Result<TransportPresetList>> getPresets(int offset, int count) async {
    return Future.delayed(Duration(milliseconds: 100)).then((_) => Ok(TransportPresetList(offset, _presets.sublist(offset, offset + count))));
  }

  @override
  Future<Result<()>> setSchedule(String scheduleId) async {
    _eventController.add(TransportEventScheduleUpdated(scheduleId, 0, 0));
    return Ok(());
  }

  @override
  Future<Result<Schedule>> getSchedule(String id) async {
    return Future.delayed(Duration(milliseconds: 20)).then((_) => Ok(_schedules[id]!));
  }

  @override
  Future<Result<TransportScheduleRotationList>> getScheduleRotations(String id, int offset, int count) async {
    return Ok(TransportScheduleRotationList(offset, _rotations.sublist(offset, offset + count)));
  }

  @override
  Future<Result<()>> setSelection(String selectionId, String? startingSongId, List<int> energies, SongDuration songDuration) async {
    if (startingSongId != null) {
      final song = _songsMap[startingSongId];
      if (song != null) {
        _eventController.add(TransportEventSongUpdated(song));
      }
    }

    play();
    _eventController.add(TransportEventSelectionUpdated(selectionId, energies));
    return Ok(());
  }

  @override
  Future<Result<Selection>> getSelection(String id) async {
    _currentSongs = _selections[id]!.defaultEnergies.expand((energy) => _songs[energy]!).toList();
    return Ok(_selections[id]!);
  }

  @override
  Future<Result<int>> getSelectionCount(String selectionId, List<int> energies)
    => Future.delayed(Duration(milliseconds: 40)).then((_) {
      _currentSongs = energies.expand((energy) => _songs[energy]!).toList();
      return Ok(_currentSongs.length);
    });

  @override
  Future<Result<TransportSelectionSongs>> getSelectionSongs(String selectionId, List<int> energies, SongSortMode sortMode, int offset, int count)
    => Future.delayed(Duration(milliseconds: 40)).then((_) => Ok(TransportSelectionSongs(offset, _currentSongs.sublist(offset, offset + count))));

  @override Future<Result<()>> setupPlayer() async {
    return Ok(());
  }

  @override Future<Result<()>> play() async {
    isPlaying = true;
    _eventController.add(TransportEventStateUpdated(PlayerState.playing));
    _eventController.add(TransportEventProgressUpdated(_runningTime, _totalTime));
    return Err(pberror.Error(generic: pberror.GenericError(title: "Player Error", message: "Cannot play in mock mode", type: pberror.ErrorType.WARNING)));
  }

  @override Future<Result<()>> stop() async {
    isPlaying = false;
    _eventController.add(TransportEventStateUpdated(PlayerState.stopped));
    return Err(pberror.Error(generic: pberror.GenericError(title: "Alert Test", message: "Cannot stop in mock mode", type: pberror.ErrorType.ERROR)));
  }

  @override Future<Result<()>> pause() async {
    isPlaying = false;
    _eventController.add(TransportEventStateUpdated(PlayerState.paused));
    return Err(pberror.Error(security: pberror.SecurityError()));
  }

  @override Future<Result<()>> next() async {
    return Err(pberror.Error(subscriptionExpired: pberror.SubscriptionExpiredError(checked: false)));
  }
  
  @override Future<Result<()>> skipToSong(String songId) async => Ok(());

  @override
  Future<Result<TransportEvent>> getCurrentPreset() async {
    return Ok(TransportEventScheduleUpdated(_presets[0].id, 0, 0));
  }

  @override
  Future<Result<Song>> getCurrentSong() async {
    return Ok(_songsMap.values.first);
  }

  @override
  Future<Result<PlayerState>> getCurrentState() async {
    return Ok(PlayerState.stopped);
  }

  @override
  Future<Result<double>> getVolume() async {
    return Ok(1);
  }

  @override Future<Result<()>> setProgress(double percentage) async {
    _eventController.add(TransportEventProgressUpdated(_runningTime, _totalTime));
    _runningTime = _totalTime * percentage;
    return Err(pberror.Error(generic: pberror.GenericError(title: "MOCK Error", message: "Event error", type: pberror.ErrorType.CONNECTION)));
  }

  @override Future<Result<()>> setVolume(double volume) async => Ok(());

  @override
  Future<Result<int>> searchResultCount(String query)
    => Future.delayed(Duration(milliseconds: 20)).then((_) => Ok(query.length));

  @override
  Future<Result<TransportSelectionSongs>> searchResultSongs(String query, int offset, int count)
    => Future.delayed(Duration(milliseconds: 20)).then((_) => Ok(TransportSelectionSongs(offset, _pinnedSongs.sublist(offset, offset + count))));

  @override Future<Result<()>> addToExceptions(String songId, bool skipToNext) async => Ok(());
  @override Future<Result<()>> removeFromExceptions(String songId) async => Ok(());

  @override Future<Result<int>> getPinnedCount() async => Ok(_pinnedSongs.length);

  @override
  Future<Result<TransportSelectionSongs>> getPinnedSongs(int offset, int count)
    => Future.delayed(Duration(milliseconds: 20)).then((_) => Ok(TransportSelectionSongs(offset, _pinnedSongs.sublist(offset, offset + count))));

  @override
  Future<Result<()>> addPinnedSong(int index, Song song)
    => Future.delayed(Duration(milliseconds: 20)).then((_) {
      if (_pinnedSongs.any((pinnedSong) => pinnedSong.id == song.id)) {
        _eventController.add(TransportEventSongPinnedUpdated(song.id, false));
        return Ok(());
      }
      
      _eventController.add(TransportEventSongPinnedUpdated(song.id, true));
      _eventController.add(TransportEventSongUpdated(song));
      _pinnedSongs.insert(index, song);
      return Ok(());
    });

  @override
  Future<Result<()>> reorderPinnedSongs(int from, int to)
    => Future.delayed(Duration(milliseconds: 20)).then((_) {
      final item = _pinnedSongs.removeAt(from);
      final insertIndex = (from < to) ? to - 1 : to;
      
      _pinnedSongs.insert(insertIndex, item);
      return Ok(());
    });

  @override
  Future<Result<int>> deletePinnedSong(String id) {
    final index = _pinnedSongs.indexWhere((song) => song.id == id);
    _pinnedSongs.removeAt(index);
    return Future.delayed(Duration(milliseconds: 20)).then((_) => Ok(index));
  }

  @override
  Future<void> dispose() async {
    _eventTimer.cancel();
  }
}

Song _songStub(String id, String artist, String title, DateTime dateAdded, [bool banned = false]) {
  final song = Song(id: id, artist: artist, title: title, played: false, liked: false, pinned: false, banned: banned, dateAdded: dateAdded);
  _songsMap[id] = song;
  return song;
}

final Map<String, Schedule> _schedules = Map.fromEntries([
  MapEntry("Sch1", Schedule("Sch1", "Weekdays", false, 7)),
  MapEntry("Sch2", Schedule("Sch2", "Weekends", false, 7)),
]);

final Map<String, Song> _songsMap = {
  "CRANBERRIES_I_STILL_DO_001": Song(id: "CRANBERRIES_I_STILL_DO_001", artist: "Cranberries", title: "I Still Do", played: false, liked: false, pinned: false, banned: false, dateAdded: DateTime(2023, 1, 4))
};

final _rotations = [
  ScheduleRotation(600, 800, [
    RotationSegment(20, "Deep1", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [4,5], SongDuration.fullLength),
  ]),
  ScheduleRotation(800, 900, [
    RotationSegment(20, "Deep1", [5,6], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [5,6], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [5,6], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [5,6], SongDuration.fullLength),
  ]),
  ScheduleRotation(900, 1100, [
    RotationSegment(20, "Deep1", [6,7], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [6,7], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [6,7], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [6,7], SongDuration.fullLength),
  ]),
  ScheduleRotation(1100, 1200, [
    RotationSegment(20, "Deep1", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [4,5], SongDuration.fullLength),
  ]),
  ScheduleRotation(1200, 1400, [
    RotationSegment(20, "Deep1", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [4,5], SongDuration.fullLength),
  ]),
  ScheduleRotation(1400, 1500, [
    RotationSegment(20, "Deep1", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [4,5], SongDuration.fullLength),
  ]),
  ScheduleRotation(1500, 1600, [
    RotationSegment(20, "Deep1", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep2", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep3", [4,5], SongDuration.fullLength),
    RotationSegment(20, "Deep4", [4,5], SongDuration.fullLength),
  ]),
];

final Map<String, Selection> _selections = Map.fromEntries([
  MapEntry("Deep1", Selection("Deep1", "Deep", "Chill", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Deep2", Selection("Deep2", "Deep", "Reprise", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Deep3", Selection("Deep3", "Deep", "Tech", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Deep4", Selection("Deep4", "Deep", "NuDisco", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Afr1", Selection("Afr1", "Afro", "Pop", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Afr2", Selection("Afr2", "Afro", "Melodic", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Afr3", Selection("Afr3", "Afro", "House", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Afr4", Selection("Afr4", "Afro", "Techno", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Tch1", Selection("Tch1", "Techno", "Pop", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Tch2", Selection("Tch2", "Techno", "Melodic", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Tch3", Selection("Tch3", "Techno", "House", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Tch4", Selection("Tch4", "Techno", "Techno", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Hs1", Selection("Hs1", "House", "Pop", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Hs2", Selection("Hs2", "House", "Melodic", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Hs3", Selection("Hs3", "House", "House", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Hs4", Selection("Hs4", "House", "Techno", false, [4,5,6,7], [4,5], 144)),
  MapEntry("TK1", Selection("TK1", "Tech", "Pop", false, [4,5,6,7], [4,5], 144)),
  MapEntry("TK2", Selection("TK2", "Tech", "Melodic", false, [4,5,6,7], [4,5], 144)),
  MapEntry("TK3", Selection("TK3", "Tech", "House", false, [4,5,6,7], [4,5], 144)),
  MapEntry("TK4", Selection("TK4", "Tech", "Techno", false, [4,5,6,7], [4,5], 144)),
  MapEntry("Tools4", Selection("Tools4", "Tools", "Events", false, [4,5,6,7], [4,5], 144)),
]);

final List<Song> _pinnedSongs = [
  _songStub("THE_WEEKND_BLINDING_LIGHTS_010", "The Weeknd", "Blinding Lights", DateTime(2023, 10, 3)), 
  _songStub("ADELE_SOMEONE_LIKE_YOU_017", "Adele", "Someone Like You", DateTime(2023, 5, 24)), 
  _songStub("DUA_LIPA_LEVITATING_025", "Dua Lipa", "Levitating", DateTime(2023, 1, 20)), 
  _songStub("TOTO_AFRICA_112", "Toto", "Africa", DateTime(2023, 4, 1)), 
  _songStub("COLDPLAY_YELLOW_042", "Coldplay", "Yellow", DateTime(2023, 6, 15)), 
  _songStub("COLDPLAY_FIX_YOU_043", "Coldplay", "Fix You", DateTime(2023, 7, 18)), 
  _songStub("EMINEM_LOSE_YOURSELF_044", "Eminem", "Lose Yourself", DateTime(2023, 8, 21)), 
  _songStub("RIHANNA_UMBRELLA_037", "Rihanna", "Umbrella", DateTime(2023, 1, 28)), 
  _songStub("RIHANNA_DIAMONDS_038", "Rihanna", "Diamonds", DateTime(2023, 2, 3)), 
  _songStub("BRUNO_MARS_UPTOWN_FUNK_039", "Bruno Mars", "Uptown Funk", DateTime(2023, 3, 6)), 
  _songStub("LORDE_ROYALS_102", "Lorde", "Royals", DateTime(2023, 6, 27)), 
  _songStub("THE_STROKES_REPTILIA_103", "The Strokes", "Reptilia", DateTime(2023, 7, 2)), 
  _songStub("KINGS_OF_LEON_USE_SOMEBODY_104", "Kings of Leon", "Use Somebody", DateTime(2023, 8, 5)), 
  _songStub("FOO_FIGHTERS_EVERLONG_105", "Foo Fighters", "Everlong", DateTime(2023, 9, 8)), 
  _songStub("RADIOHEAD_CREEP_106", "Radiohead", "Creep", DateTime(2023, 10, 11)), 
  _songStub("OASIS_WONDERWALL_107", "Oasis", "Wonderwall", DateTime(2023, 11, 14)), 
  _songStub("FRED_AGAIN_DELILAH_PULL_ME_OUT_OF_THIS_209", "Fred again..", "Delilah (pull me out of this)", DateTime(2024, 5, 12)), 
  _songStub("DAVID_KUSHNER_DAYLIGHT_210", "David Kushner", "Daylight", DateTime(2024, 6, 15)), 
  _songStub("RAYE_ESCAPISM_211", "RAYE", "Escapism.", DateTime(2024, 7, 18)), 
  _songStub("CENTRAL_CEE_DOJA_212", "Central Cee", "Doja", DateTime(2024, 8, 21)), 
  _songStub("STORMZY_VOSSI_BOP_213", "Stormzy", "Vossi Bop", DateTime(2024, 9, 24)), 
  _songStub("SKEPTA_SHUTDOWN_214", "Skepta", "Shutdown", DateTime(2024, 10, 27)), 
  _songStub("AITCH_TASTE_215", "Aitch", "Taste", DateTime(2024, 11, 2)), 
  _songStub("REMA_CALM_DOWN_216", "Rema", "Calm Down", DateTime(2024, 12, 5)), 
  _songStub("TEMS_FREE_MIND_217", "Tems", "Free Mind", DateTime(2024, 1, 8)), 
];

final Map<int, List<Song>> _songs = Map.fromEntries([
  MapEntry(4, [
    _songStub("CRANBERRIES_I_STILL_DO_001", "Cranberries", "I Still Do", DateTime(2023, 1, 4)), 
    _songStub("TAYLOR_SWIFT_ANTI_HERO_002", "Taylor Swift", "Anti-Hero", DateTime(2023, 2, 7)), 
    _songStub("TAYLOR_SWIFT_BLANK_SPACE_003", "Taylor Swift", "Blank Space", DateTime(2023, 3, 10)), 
    _songStub("TAYLOR_SWIFT_SHAKE_IT_OFF_004", "Taylor Swift", "Shake It Off", DateTime(2023, 4, 13)), 
    _songStub("TAYLOR_SWIFT_LOVE_STORY_005", "Taylor Swift", "Love Story", DateTime(2023, 5, 16)), 
    _songStub("ED_SHEERAN_SHAPE_OF_YOU_006", "Ed Sheeran", "Shape of You", DateTime(2023, 6, 19)), 
    _songStub("ED_SHEERAN_PERFECT_007", "Ed Sheeran", "Perfect", DateTime(2023, 7, 22)), 
    _songStub("ED_SHEERAN_BAD_HABITS_008", "Ed Sheeran", "Bad Habits", DateTime(2023, 8, 25)), 
    _songStub("THE_WEEKND_BLINDING_LIGHTS_010", "The Weeknd", "Blinding Lights", DateTime(2023, 10, 3)), 
    _songStub("THE_WEEKND_SAVE_YOUR_TEARS_011", "The Weeknd", "Save Your Tears", DateTime(2023, 11, 6)), 
    _songStub("THE_WEEKND_STARBOY_012", "The Weeknd", "Starboy", DateTime(2023, 12, 9)), 
    _songStub("DRAKE_GOD_S_PLAN_013", "Drake", "God's Plan", DateTime(2023, 1, 12)), 
    _songStub("DRAKE_HOTLINE_BLING_014", "Drake", "Hotline Bling", DateTime(2023, 2, 15)), 
    _songStub("ADELE_HELLO_015", "Adele", "Hello", DateTime(2023, 3, 18)), 
    _songStub("ADELE_ROLLING_IN_THE_DEEP_016", "Adele", "Rolling in the Deep", DateTime(2023, 4, 21)), 
    _songStub("ADELE_SOMEONE_LIKE_YOU_017", "Adele", "Someone Like You", DateTime(2023, 5, 24)), 
    _songStub("BILLIE_EILISH_BAD_GUY_018", "Billie Eilish", "bad guy", DateTime(2023, 6, 27)), 
    _songStub("BILLIE_EILISH_HAPPIER_THAN_EVER_019", "Billie Eilish", "Happier Than Ever", DateTime(2023, 7, 2)), 
    _songStub("BTS_DYNAMITE_020", "BTS", "Dynamite", DateTime(2023, 8, 5)), 
    _songStub("BTS_BUTTER_021", "BTS", "Butter", DateTime(2023, 9, 8)), 
    _songStub("OLIVIA_RODRIGO_DRIVERS_LICENSE_022", "Olivia Rodrigo", "drivers license", DateTime(2023, 10, 11)), 
    _songStub("OLIVIA_RODRIGO_GOOD_4_U_023", "Olivia Rodrigo", "good 4 u", DateTime(2023, 11, 14)), 
    _songStub("OLIVIA_RODRIGO_VAMPIRE_024", "Olivia Rodrigo", "vampire", DateTime(2023, 12, 17)), 
    _songStub("DUA_LIPA_LEVITATING_025", "Dua Lipa", "Levitating", DateTime(2023, 1, 20)), 
    _songStub("DUA_LIPA_DON_T_START_NOW_026", "Dua Lipa", "Don't Start Now", DateTime(2023, 2, 23)), 
    _songStub("HARRY_STYLES_AS_IT_WAS_027", "Harry Styles", "As It Was", DateTime(2023, 3, 26)), 
    _songStub("HARRY_STYLES_WATERMELON_SUGAR_028", "Harry Styles", "Watermelon Sugar", DateTime(2023, 4, 1)), 
    _songStub("POST_MALONE_CIRCLES_029", "Post Malone", "Circles", DateTime(2023, 5, 4)), 
    _songStub("POST_MALONE_ROCKSTAR_030", "Post Malone", "Rockstar", DateTime(2023, 6, 7)), 
    _songStub("POST_MALONE_SUNFLOWER_031", "Post Malone", "Sunflower", DateTime(2023, 7, 10)), 
    _songStub("IMAGINE_DRAGONS_BELIEVER_032", "Imagine Dragons", "Believer", DateTime(2023, 8, 13)), 
    _songStub("IMAGINE_DRAGONS_THUNDER_033", "Imagine Dragons", "Thunder", DateTime(2023, 9, 16)), 
    _songStub("IMAGINE_DRAGONS_RADIOACTIVE_034", "Imagine Dragons", "Radioactive", DateTime(2023, 10, 19)), 
    _songStub("JUSTIN_BIEBER_SORRY_035", "Justin Bieber", "Sorry", DateTime(2023, 11, 22)), 
    _songStub("JUSTIN_BIEBER_PEACHES_036", "Justin Bieber", "Peaches", DateTime(2023, 12, 25)), 
    _songStub("RIHANNA_UMBRELLA_037", "Rihanna", "Umbrella", DateTime(2023, 1, 28)), 
    _songStub("RIHANNA_DIAMONDS_038", "Rihanna", "Diamonds", DateTime(2023, 2, 3)), 
    _songStub("BRUNO_MARS_UPTOWN_FUNK_039", "Bruno Mars", "Uptown Funk", DateTime(2023, 3, 6)), 
    _songStub("BRUNO_MARS_LOCKED_OUT_OF_HEAVEN_040", "Bruno Mars", "Locked Out of Heaven", DateTime(2023, 4, 9)), 
    _songStub("COLDPLAY_VIVA_LA_VIDA_041", "Coldplay", "Viva la Vida", DateTime(2023, 5, 12)), 
    _songStub("COLDPLAY_YELLOW_042", "Coldplay", "Yellow", DateTime(2023, 6, 15)), 
    _songStub("COLDPLAY_FIX_YOU_043", "Coldplay", "Fix You", DateTime(2023, 7, 18)), 
    _songStub("EMINEM_LOSE_YOURSELF_044", "Eminem", "Lose Yourself", DateTime(2023, 8, 21)), 
    _songStub("EMINEM_WITHOUT_ME_045", "Eminem", "Without Me", DateTime(2023, 9, 24)), 
    _songStub("KENDRICK_LAMAR_HUMBLE_046", "Kendrick Lamar", "HUMBLE.", DateTime(2023, 10, 27)), 
    _songStub("KENDRICK_LAMAR_ALRIGHT_047", "Kendrick Lamar", "Alright", DateTime(2023, 11, 2)), 
    _songStub("THE_BEATLES_HEY_JUDE_048", "The Beatles", "Hey Jude", DateTime(2023, 12, 5)), 
    _songStub("THE_BEATLES_LET_IT_BE_049", "The Beatles", "Let It Be", DateTime(2023, 1, 8)), 
    _songStub("THE_BEATLES_COME_TOGETHER_050", "The Beatles", "Come Together", DateTime(2023, 2, 11)), 
    _songStub("QUEEN_BOHEMIAN_RHAPSODY_051", "Queen", "Bohemian Rhapsody", DateTime(2023, 3, 14)), 
    _songStub("QUEEN_ANOTHER_ONE_BITES_THE_DUST_052", "Queen", "Another One Bites the Dust", DateTime(2023, 4, 17)), 
    _songStub("MICHAEL_JACKSON_BILLIE_JEAN_053", "Michael Jackson", "Billie Jean", DateTime(2023, 5, 20)), 
    _songStub("MICHAEL_JACKSON_BEAT_IT_054", "Michael Jackson", "Beat It", DateTime(2023, 6, 23)), 
    _songStub("LED_ZEPPELIN_STAIRWAY_TO_HEAVEN_055", "Led Zeppelin", "Stairway to Heaven", DateTime(2023, 7, 26)), 
    _songStub("PINK_FLOYD_WISH_YOU_WERE_HERE_056", "Pink Floyd", "Wish You Were Here", DateTime(2023, 8, 1)), 
    _songStub("PINK_FLOYD_ANOTHER_BRICK_IN_THE_WALL_057", "Pink Floyd", "Another Brick in the Wall", DateTime(2023, 9, 4)), 
    _songStub("U2_WITH_OR_WITHOUT_YOU_058", "U2", "With or Without You", DateTime(2023, 10, 7)), 
    _songStub("METALLICA_ENTER_SANDMAN_059", "Metallica", "Enter Sandman", DateTime(2023, 11, 10)), 
    _songStub("NIRVANA_SMELLS_LIKE_TEEN_SPIRIT_060", "Nirvana", "Smells Like Teen Spirit", DateTime(2023, 12, 13)), 
    _songStub("LINKIN_PARK_IN_THE_END_061", "Linkin Park", "In the End", DateTime(2023, 1, 16)), 
    _songStub("LINKIN_PARK_NUMB_062", "Linkin Park", "Numb", DateTime(2023, 2, 19)), 
    _songStub("GREEN_DAY_BOULEVARD_OF_BROKEN_DREAMS_063", "Green Day", "Boulevard of Broken Dreams", DateTime(2023, 3, 22)), 
    _songStub("RED_HOT_CHILI_PEPPERS_CALIFORNICATION_064", "Red Hot Chili Peppers", "Californication", DateTime(2023, 4, 25)), 
    _songStub("RED_HOT_CHILI_PEPPERS_UNDER_THE_BRIDGE_065", "Red Hot Chili Peppers", "Under the Bridge", DateTime(2023, 5, 28)), 
    _songStub("THE_KILLERS_MR_BRIGHTSIDE_066", "The Killers", "Mr. Brightside", DateTime(2023, 6, 3)), 
    _songStub("ARCTIC_MONKEYS_DO_I_WANNA_KNOW_067", "Arctic Monkeys", "Do I Wanna Know?", DateTime(2023, 7, 6)), 
    _songStub("THE_ROLLING_STONES_PAINT_IT_BLACK_068", "The Rolling Stones", "Paint It Black", DateTime(2023, 8, 9)), 
    _songStub("BON_JOVI_LIVIN_ON_A_PRAYER_069", "Bon Jovi", "Livin' on a Prayer", DateTime(2023, 9, 12)), 
  ]),
  MapEntry(5, [
    _songStub("BACKSTREET_BOYS_I_WANT_IT_THAT_WAY_070", "Backstreet Boys", "I Want It That Way", DateTime(2023, 10, 15)), 
    _songStub("BRITNEY_SPEARS_BABY_ONE_MORE_TIME_071", "Britney Spears", "...Baby One More Time", DateTime(2023, 11, 18), true), 
    _songStub("SHAKIRA_HIPS_DON_T_LIE_072", "Shakira", "Hips Don't Lie", DateTime(2023, 12, 21)), 
    _songStub("BEYONC_SINGLE_LADIES_073", "Beyoncé", "Single Ladies", DateTime(2023, 1, 24)), 
    _songStub("BEYONC_HALO_074", "Beyoncé", "Halo", DateTime(2023, 2, 27)), 
    _songStub("LADY_GAGA_BAD_ROMANCE_075", "Lady Gaga", "Bad Romance", DateTime(2023, 3, 2)), 
    _songStub("LADY_GAGA_POKER_FACE_076", "Lady Gaga", "Poker Face", DateTime(2023, 4, 5)), 
    _songStub("KATY_PERRY_FIREWORK_077", "Katy Perry", "Firework", DateTime(2023, 5, 8)), 
    _songStub("KATY_PERRY_ROAR_078", "Katy Perry", "Roar", DateTime(2023, 6, 11)), 
    _songStub("ARIANA_GRANDE_7_RINGS_079", "Ariana Grande", "7 rings", DateTime(2023, 7, 14)), 
    _songStub("ARIANA_GRANDE_THANK_U_NEXT_080", "Ariana Grande", "thank u, next", DateTime(2023, 8, 17)), 
    _songStub("THE_POLICE_EVERY_BREATH_YOU_TAKE_081", "The Police", "Every Breath You Take", DateTime(2023, 9, 20)), 
    _songStub("EAGLES_HOTEL_CALIFORNIA_082", "Eagles", "Hotel California", DateTime(2023, 10, 23)), 
    _songStub("JOURNEY_DON_T_STOP_BELIEVIN_083", "Journey", "Don't Stop Believin'", DateTime(2023, 11, 26)), 
    _songStub("ABBA_DANCING_QUEEN_084", "ABBA", "Dancing Queen", DateTime(2023, 12, 1)), 
    _songStub("WHITNEY_HOUSTON_I_WILL_ALWAYS_LOVE_YOU_085", "Whitney Houston", "I Will Always Love You", DateTime(2023, 1, 4)), 
    _songStub("CELINE_DION_MY_HEART_WILL_GO_ON_086", "Celine Dion", "My Heart Will Go On", DateTime(2023, 2, 7)), 
    _songStub("SIA_CHANDELIER_087", "Sia", "Chandelier", DateTime(2023, 3, 10)), 
    _songStub("THE_CHAINSMOKERS_CLOSER_088", "The Chainsmokers", "Closer", DateTime(2023, 4, 13)), 
    _songStub("MAROON_5_SUGAR_089", "Maroon 5", "Sugar", DateTime(2023, 5, 16)), 
    _songStub("MAROON_5_GIRLS_LIKE_YOU_090", "Maroon 5", "Girls Like You", DateTime(2023, 6, 19)), 
    _songStub("SHAWN_MENDES_SE_ORITA_091", "Shawn Mendes", "Señorita", DateTime(2023, 7, 22)), 
    _songStub("CAMILA_CABELLO_HAVANA_092", "Camila Cabello", "Havana", DateTime(2023, 8, 25)), 
    _songStub("ONEREPUBLIC_COUNTING_STARS_093", "OneRepublic", "Counting Stars", DateTime(2023, 9, 28)), 
    _songStub("ONE_DIRECTION_WHAT_MAKES_YOU_BEAUTIFUL_094", "One Direction", "What Makes You Beautiful", DateTime(2023, 10, 3)), 
    _songStub("THE_WEEKND_IN_THE_NIGHT_095", "The Weeknd", "In The Night", DateTime(2023, 11, 6)), 
    _songStub("DAFT_PUNK_GET_LUCKY_096", "Daft Punk", "Get Lucky", DateTime(2023, 12, 9)), 
    _songStub("PHARRELL_WILLIAMS_HAPPY_097", "Pharrell Williams", "Happy", DateTime(2023, 1, 12)), 
    _songStub("TONES_AND_I_DANCE_MONKEY_098", "Tones and I", "Dance Monkey", DateTime(2023, 2, 15)), 
    _songStub("GOTYE_SOMEBODY_THAT_I_USED_TO_KNOW_099", "Gotye", "Somebody That I Used To Know", DateTime(2023, 3, 18)), 
    _songStub("THE_LUMINEERS_HO_HEY_100", "The Lumineers", "Ho Hey", DateTime(2023, 4, 21)), 
    _songStub("FUN_WE_ARE_YOUNG_101", "Fun.", "We Are Young", DateTime(2023, 5, 24)), 
    _songStub("LORDE_ROYALS_102", "Lorde", "Royals", DateTime(2023, 6, 27)), 
    _songStub("THE_STROKES_REPTILIA_103", "The Strokes", "Reptilia", DateTime(2023, 7, 2)), 
    _songStub("KINGS_OF_LEON_USE_SOMEBODY_104", "Kings of Leon", "Use Somebody", DateTime(2023, 8, 5)), 
    _songStub("FOO_FIGHTERS_EVERLONG_105", "Foo Fighters", "Everlong", DateTime(2023, 9, 8)), 
    _songStub("RADIOHEAD_CREEP_106", "Radiohead", "Creep", DateTime(2023, 10, 11)), 
    _songStub("OASIS_WONDERWALL_107", "Oasis", "Wonderwall", DateTime(2023, 11, 14)), 
    _songStub("THE_SMITHS_THERE_IS_A_LIGHT_THAT_NEVER_GOES_OUT_108", "The Smiths", "There Is a Light That Never Goes Out", DateTime(2023, 12, 17)), 
    _songStub("THE_CURE_JUST_LIKE_HEAVEN_109", "The Cure", "Just Like Heaven", DateTime(2023, 1, 20)), 
    _songStub("DEPECHE_MODE_ENJOY_THE_SILENCE_110", "Depeche Mode", "Enjoy the Silence", DateTime(2023, 2, 23)), 
    _songStub("A_HA_TAKE_ON_ME_111", "a-ha", "Take On Me", DateTime(2023, 3, 26)), 
    _songStub("TOTO_AFRICA_112", "Toto", "Africa", DateTime(2023, 4, 1)), 
    _songStub("AMY_WINEHOUSE_REHAB_113", "Amy Winehouse", "Rehab", DateTime(2023, 5, 4)), 
    _songStub("THE_WHITE_STRIPES_SEVEN_NATION_ARMY_114", "The White Stripes", "Seven Nation Army", DateTime(2023, 6, 7)), 
    _songStub("MGMT_KIDS_115", "MGMT", "Kids", DateTime(2023, 7, 10)), 
    _songStub("THE_NATIONAL_BLOODBUZZ_OHIO_116", "The National", "Bloodbuzz Ohio", DateTime(2023, 8, 13)), 
    _songStub("FLORENCE_THE_MACHINE_DOG_DAYS_ARE_OVER_117", "Florence + The Machine", "Dog Days Are Over", DateTime(2023, 9, 16)), 
    _songStub("ALICIA_KEYS_FALLIN_118", "Alicia Keys", "Fallin'", DateTime(2023, 10, 19)), 
    _songStub("ALICIA_KEYS_IF_I_AIN_T_GOT_YOU_119", "Alicia Keys", "If I Ain't Got You", DateTime(2023, 11, 22)), 
    _songStub("JOHN_LEGEND_ALL_OF_ME_120", "John Legend", "All of Me", DateTime(2023, 12, 25)), 
    _songStub("SAM_SMITH_STAY_WITH_ME_121", "Sam Smith", "Stay With Me", DateTime(2023, 1, 28)), 
    _songStub("HOZIER_TAKE_ME_TO_CHURCH_122", "Hozier", "Take Me To Church", DateTime(2023, 2, 3)), 
    _songStub("SIA_CHEAP_THRILLS_123", "Sia", "Cheap Thrills", DateTime(2023, 3, 6)), 
    _songStub("DJ_SNAKE_LET_ME_LOVE_YOU_124", "DJ Snake", "Let Me Love You", DateTime(2023, 4, 9)), 
    _songStub("MAJOR_LAZER_LEAN_ON_125", "Major Lazer", "Lean On", DateTime(2023, 5, 12)), 
    _songStub("ZEDD_THE_MIDDLE_126", "Zedd", "The Middle", DateTime(2023, 6, 15)), 
    _songStub("MARSHMELLO_HAPPIER_127", "Marshmello", "Happier", DateTime(2023, 7, 18)), 
    _songStub("AVICII_WAKE_ME_UP_128", "Avicii", "Wake Me Up", DateTime(2023, 8, 21)), 
    _songStub("SWEDISH_HOUSE_MAFIA_DON_T_YOU_WORRY_CHILD_129", "Swedish House Mafia", "Don't You Worry Child", DateTime(2023, 9, 24)), 
    _songStub("CALVIN_HARRIS_THIS_IS_WHAT_YOU_CAME_FOR_130", "Calvin Harris", "This Is What You Came For", DateTime(2023, 10, 27)), 
    _songStub("CALVIN_HARRIS_SUMMER_131", "Calvin Harris", "Summer", DateTime(2023, 11, 2)), 
    _songStub("DAVID_GUETTA_TITANIUM_132", "David Guetta", "Titanium", DateTime(2023, 12, 5)), 
    _songStub("DISCLOSURE_LATCH_133", "Disclosure", "Latch", DateTime(2023, 1, 8)), 
    _songStub("CLEAN_BANDIT_RATHER_BE_134", "Clean Bandit", "Rather Be", DateTime(2023, 2, 11)), 
    _songStub("THE_XX_INTRO_135", "The XX", "Intro", DateTime(2023, 3, 14)), 
    _songStub("THE_NEIGHBOURHOOD_SWEATER_WEATHER_136", "The Neighbourhood", "Sweater Weather", DateTime(2023, 4, 17)), 
    _songStub("TWENTY_ONE_PILOTS_STRESSED_OUT_137", "Twenty One Pilots", "Stressed Out", DateTime(2023, 5, 20)), 
    _songStub("THE_1975_SOMEBODY_ELSE_138", "The 1975", "Somebody Else", DateTime(2023, 6, 23)), 
    _songStub("LANA_DEL_REY_SUMMERTIME_SADNESS_139", "Lana Del Rey", "Summertime Sadness", DateTime(2023, 7, 26)), 
    _songStub("KANYE_WEST_STRONGER_140", "Kanye West", "Stronger", DateTime(2023, 8, 1)), 
    _songStub("JAY_Z_EMPIRE_STATE_OF_MIND_141", "Jay-Z", "Empire State of Mind", DateTime(2023, 9, 4)), 
    _songStub("OUTKAST_HEY_YA_142", "OutKast", "Hey Ya!", DateTime(2023, 10, 7)), 
    _songStub("THE_NOTORIOUS_B_I_G_JUICY_143", "The Notorious B.I.G.", "Juicy", DateTime(2023, 11, 10)), 
    _songStub("2PAC_CALIFORNIA_LOVE_144", "2Pac", "California Love", DateTime(2023, 12, 13)), 
    _songStub("CHILDISH_GAMBINO_REDBONE_145", "Childish Gambino", "Redbone", DateTime(2023, 1, 16)), 
    _songStub("LIL_NAS_X_OLD_TOWN_ROAD_146", "Lil Nas X", "Old Town Road", DateTime(2023, 2, 19)), 
    _songStub("TRAVIS_SCOTT_SICKO_MODE_147", "Travis Scott", "SICKO MODE", DateTime(2023, 3, 22)), 
  ]),
  MapEntry(6, [
    _songStub("FUTURE_MASK_OFF_148", "Future", "Mask Off", DateTime(2023, 4, 25)), 
    _songStub("MIGOS_BAD_AND_BOUJEE_149", "Migos", "Bad and Boujee", DateTime(2023, 5, 28)), 
    _songStub("DOJA_CAT_SAY_SO_150", "Doja Cat", "Say So", DateTime(2023, 6, 3)), 
    _songStub("MILEY_CYRUS_FLOWERS_151", "Miley Cyrus", "Flowers", DateTime(2024, 7, 6)), 
    _songStub("SZA_KILL_BILL_152", "SZA", "Kill Bill", DateTime(2024, 8, 9)), 
    _songStub("TYLER_THE_CREATOR_EARFQUAKE_153", "Tyler, The Creator", "EARFQUAKE", DateTime(2024, 9, 12)), 
    _songStub("THE_WEEKND_DIE_FOR_YOU_154", "The Weeknd", "Die For You", DateTime(2024, 10, 15)), 
    _songStub("SELENA_GOMEZ_LOSE_YOU_TO_LOVE_ME_155", "Selena Gomez", "Lose You To Love Me", DateTime(2024, 11, 18)), 
    _songStub("DEMI_LOVATO_SORRY_NOT_SORRY_156", "Demi Lovato", "Sorry Not Sorry", DateTime(2024, 12, 21)), 
    _songStub("KELLY_CLARKSON_SINCE_U_BEEN_GONE_157", "Kelly Clarkson", "Since U Been Gone", DateTime(2024, 1, 24)), 
    _songStub("CHRISTINA_AGUILERA_BEAUTIFUL_158", "Christina Aguilera", "Beautiful", DateTime(2024, 2, 27)), 
    _songStub("PINK_JUST_GIVE_ME_A_REASON_159", "Pink", "Just Give Me a Reason", DateTime(2024, 3, 2)), 
    _songStub("SHAKIRA_WAKA_WAKA_160", "Shakira", "Waka Waka", DateTime(2024, 4, 5)), 
    _songStub("LUIS_FONSI_DESPACITO_161", "Luis Fonsi", "Despacito", DateTime(2024, 5, 8)), 
    _songStub("ENRIQUE_IGLESIAS_BAILANDO_162", "Enrique Iglesias", "Bailando", DateTime(2024, 6, 11)), 
    _songStub("J_BALVIN_MI_GENTE_163", "J Balvin", "Mi Gente", DateTime(2024, 7, 14)), 
    _songStub("BAD_BUNNY_TIT_ME_PREGUNT_164", "Bad Bunny", "Tití Me Preguntó", DateTime(2024, 8, 17)), 
    _songStub("ROSAL_A_DESPECH_165", "Rosalía", "DESPECHÁ", DateTime(2024, 9, 20)), 
    _songStub("KAROL_G_TUSA_166", "Karol G", "Tusa", DateTime(2024, 10, 23)), 
    _songStub("MALUMA_FELICES_LOS_4_167", "Maluma", "Felices los 4", DateTime(2024, 11, 26)), 
    _songStub("DADDY_YANKEE_GASOLINA_168", "Daddy Yankee", "Gasolina", DateTime(2024, 12, 1)), 
    _songStub("OZUNA_SE_PREPAR_169", "Ozuna", "Se Preparó", DateTime(2024, 1, 4)), 
    _songStub("ANITTA_ENVOLVER_170", "Anitta", "Envolver", DateTime(2024, 2, 7)), 
    _songStub("BLACKPINK_HOW_YOU_LIKE_THAT_171", "BLACKPINK", "How You Like That", DateTime(2024, 3, 10)), 
    _songStub("TWICE_THE_FEELS_172", "TWICE", "The Feels", DateTime(2024, 4, 13)), 
    _songStub("NEWJEANS_SUPER_SHY_173", "NewJeans", "Super Shy", DateTime(2024, 5, 16)), 
    _songStub("IVE_LOVE_DIVE_174", "IVE", "Love Dive", DateTime(2024, 6, 19)), 
    _songStub("ITZY_WANNABE_175", "ITZY", "WANNABE", DateTime(2024, 7, 22)), 
    _songStub("STRAY_KIDS_MANIAC_176", "Stray Kids", "MANIAC", DateTime(2024, 8, 25)), 
    _songStub("SEVENTEEN_SUPER_177", "SEVENTEEN", "Super", DateTime(2024, 9, 28)), 
    _songStub("TXT_SUGAR_RUSH_RIDE_178", "TXT", "Sugar Rush Ride", DateTime(2024, 10, 3)), 
    _songStub("AURORA_RUNAWAY_179", "AURORA", "Runaway", DateTime(2024, 11, 6)), 
    _songStub("OF_MONSTERS_AND_MEN_LITTLE_TALKS_180", "Of Monsters and Men", "Little Talks", DateTime(2024, 12, 9)), 
    _songStub("A_GREAT_BIG_WORLD_SAY_SOMETHING_181", "A Great Big World", "Say Something", DateTime(2024, 1, 12)), 
    _songStub("KESHA_TIK_TOK_182", "Kesha", "Tik Tok", DateTime(2024, 2, 15)), 
    _songStub("AKON_SMACK_THAT_183", "Akon", "Smack That", DateTime(2024, 3, 18)), 
    _songStub("SEAN_PAUL_TEMPERATURE_184", "Sean Paul", "Temperature", DateTime(2024, 4, 21)), 
    _songStub("NE_YO_SO_SICK_185", "Ne-Yo", "So Sick", DateTime(2024, 5, 24)), 
    _songStub("JASON_DERULO_TALK_DIRTY_186", "Jason Derulo", "Talk Dirty", DateTime(2024, 6, 27)), 
    _songStub("THE_SCRIPT_HALL_OF_FAME_187", "The Script", "Hall of Fame", DateTime(2024, 7, 2)), 
    _songStub("GNARLS_BARKLEY_CRAZY_188", "Gnarls Barkley", "Crazy", DateTime(2024, 8, 5)), 
    _songStub("NICKI_MINAJ_SUPER_BASS_189", "Nicki Minaj", "Super Bass", DateTime(2024, 9, 8)), 
    _songStub("CARDI_B_I_LIKE_IT_190", "Cardi B", "I Like It", DateTime(2024, 10, 11)), 
    _songStub("MEGHAN_TRAINOR_ALL_ABOUT_THAT_BASS_191", "Meghan Trainor", "All About That Bass", DateTime(2024, 11, 14)), 
    _songStub("ELLIE_GOULDING_LOVE_ME_LIKE_YOU_DO_192", "Ellie Goulding", "Love Me Like You Do", DateTime(2024, 12, 17)), 
    _songStub("JESSIE_J_PRICE_TAG_193", "Jessie J", "Price Tag", DateTime(2024, 1, 20)), 
    _songStub("RITA_ORA_ANYWHERE_194", "Rita Ora", "Anywhere", DateTime(2024, 2, 23)), 
    _songStub("ZAYN_PILLOWTALK_195", "ZAYN", "PILLOWTALK", DateTime(2024, 3, 26)), 
    _songStub("CHARLIE_PUTH_ATTENTION_196", "Charlie Puth", "Attention", DateTime(2024, 4, 1)), 
    _songStub("LEWIS_CAPALDI_SOMEONE_YOU_LOVED_197", "Lewis Capaldi", "Someone You Loved", DateTime(2024, 5, 4)), 
    _songStub("BEBE_REXHA_MEANT_TO_BE_198", "Bebe Rexha", "Meant to Be", DateTime(2024, 6, 7)), 
    _songStub("MARINA_PRIMADONNA_199", "Marina", "Primadonna", DateTime(2024, 7, 10)), 
    _songStub("CARLY_RAE_JEPSEN_CALL_ME_MAYBE_200", "Carly Rae Jepsen", "Call Me Maybe", DateTime(2024, 8, 13)), 
    _songStub("ICONA_POP_I_LOVE_IT_201", "Icona Pop", "I Love It", DateTime(2024, 9, 16)), 
    _songStub("KUNGS_THIS_GIRL_202", "Kungs", "This Girl", DateTime(2024, 10, 19)), 
    _songStub("PORTUGAL_THE_MAN_FEEL_IT_STILL_203", "Portugal. The Man", "Feel It Still", DateTime(2024, 11, 22)), 
    _songStub("GLASS_ANIMALS_HEAT_WAVES_204", "Glass Animals", "Heat Waves", DateTime(2024, 12, 25)), 
    _songStub("BENSON_BOONE_BEAUTIFUL_THINGS_205", "Benson Boone", "Beautiful Things", DateTime(2024, 1, 28)), 
    _songStub("TATE_MCRAE_GREEDY_206", "Tate McRae", "greedy", DateTime(2024, 2, 3)), 
    _songStub("SABRINA_CARPENTER_PLEASE_PLEASE_PLEASE_207", "Sabrina Carpenter", "Please Please Please", DateTime(2024, 3, 6)), 
    _songStub("NOAH_KAHAN_STICK_SEASON_208", "Noah Kahan", "Stick Season", DateTime(2024, 4, 9)), 
    _songStub("FRED_AGAIN_DELILAH_PULL_ME_OUT_OF_THIS_209", "Fred again..", "Delilah (pull me out of this)", DateTime(2024, 5, 12)), 
    _songStub("DAVID_KUSHNER_DAYLIGHT_210", "David Kushner", "Daylight", DateTime(2024, 6, 15)), 
    _songStub("RAYE_ESCAPISM_211", "RAYE", "Escapism.", DateTime(2024, 7, 18)), 
    _songStub("CENTRAL_CEE_DOJA_212", "Central Cee", "Doja", DateTime(2024, 8, 21)), 
    _songStub("STORMZY_VOSSI_BOP_213", "Stormzy", "Vossi Bop", DateTime(2024, 9, 24)), 
    _songStub("SKEPTA_SHUTDOWN_214", "Skepta", "Shutdown", DateTime(2024, 10, 27)), 
    _songStub("AITCH_TASTE_215", "Aitch", "Taste", DateTime(2024, 11, 2)), 
    _songStub("REMA_CALM_DOWN_216", "Rema", "Calm Down", DateTime(2024, 12, 5)), 
    _songStub("TEMS_FREE_MIND_217", "Tems", "Free Mind", DateTime(2024, 1, 8)), 
  ]),
  MapEntry(7, [
    _songStub("BURNA_BOY_LAST_LAST_218", "Burna Boy", "Last Last", DateTime(2024, 2, 11)), 
    _songStub("WIZKID_ESSENCE_219", "Wizkid", "Essence", DateTime(2024, 3, 14)), 
    _songStub("AYRA_STARR_RUSH_220", "Ayra Starr", "Rush", DateTime(2024, 4, 17)), 
    _songStub("CKAY_LOVE_NWANTITI_221", "CKay", "love nwantiti", DateTime(2024, 5, 20)), 
    _songStub("FIREBOY_DML_PERU_222", "Fireboy DML", "Peru", DateTime(2024, 6, 23)), 
    _songStub("ASAKE_LONELY_AT_THE_TOP_223", "Asake", "Lonely At The Top", DateTime(2024, 7, 26)), 
    _songStub("THE_KINKS_WATERLOO_SUNSET_224", "The Kinks", "Waterloo Sunset", DateTime(2024, 8, 1)), 
    _songStub("THE_WHO_BABA_O_RILEY_225", "The Who", "Baba O'Riley", DateTime(2024, 9, 4)), 
    _songStub("BRUCE_SPRINGSTEEN_BORN_TO_RUN_226", "Bruce Springsteen", "Born to Run", DateTime(2024, 10, 7)), 
    _songStub("BOB_DYLAN_LIKE_A_ROLLING_STONE_227", "Bob Dylan", "Like a Rolling Stone", DateTime(2024, 11, 10)), 
    _songStub("SIMON_GARFUNKEL_THE_SOUND_OF_SILENCE_228", "Simon & Garfunkel", "The Sound of Silence", DateTime(2024, 12, 13)), 
    _songStub("PAUL_SIMON_YOU_CAN_CALL_ME_AL_229", "Paul Simon", "You Can Call Me Al", DateTime(2024, 1, 16)), 
    _songStub("PHIL_COLLINS_IN_THE_AIR_TONIGHT_230", "Phil Collins", "In the Air Tonight", DateTime(2024, 2, 19)), 
    _songStub("DIRE_STRAITS_SULTANS_OF_SWING_231", "Dire Straits", "Sultans of Swing", DateTime(2024, 3, 22)), 
    _songStub("R_E_M_LOSING_MY_RELIGION_232", "R.E.M.", "Losing My Religion", DateTime(2024, 4, 25)), 
    _songStub("DEFTONES_CHANGE_IN_THE_HOUSE_OF_FLIES_233", "Deftones", "Change (In the House of Flies)", DateTime(2024, 5, 28)), 
    _songStub("SYSTEM_OF_A_DOWN_CHOP_SUEY_234", "System Of A Down", "Chop Suey!", DateTime(2024, 6, 3)), 
    _songStub("PARAMORE_MISERY_BUSINESS_235", "Paramore", "Misery Business", DateTime(2024, 7, 6)), 
    _songStub("FALL_OUT_BOY_SUGAR_WE_RE_GOIN_DOWN_236", "Fall Out Boy", "Sugar, We're Goin Down", DateTime(2024, 8, 9)), 
    _songStub("PANIC_AT_THE_DISCO_I_WRITE_SINS_NOT_TRAGEDIES_237", "Panic! At The Disco", "I Write Sins Not Tragedies", DateTime(2024, 9, 12)), 
    _songStub("MY_CHEMICAL_ROMANCE_WELCOME_TO_THE_BLACK_PARADE_238", "My Chemical Romance", "Welcome to the Black Parade", DateTime(2024, 10, 15)), 
    _songStub("EVANESCENCE_BRING_ME_TO_LIFE_239", "Evanescence", "Bring Me To Life", DateTime(2024, 11, 18)), 
    _songStub("AVRIL_LAVIGNE_COMPLICATED_240", "Avril Lavigne", "Complicated", DateTime(2024, 12, 21)), 
    _songStub("THE_VERVE_BITTER_SWEET_SYMPHONY_241", "The Verve", "Bitter Sweet Symphony", DateTime(2024, 1, 24)), 
    _songStub("SNOW_PATROL_CHASING_CARS_242", "Snow Patrol", "Chasing Cars", DateTime(2024, 2, 27)), 
    _songStub("KEANE_SOMEWHERE_ONLY_WE_KNOW_243", "Keane", "Somewhere Only We Know", DateTime(2024, 3, 2)), 
    _songStub("MATCHBOX_TWENTY_UNWELL_244", "Matchbox Twenty", "Unwell", DateTime(2024, 4, 5)), 
    _songStub("TRAIN_HEY_SOUL_SISTER_245", "Train", "Hey, Soul Sister", DateTime(2024, 5, 8)), 
    _songStub("THE_FRAY_HOW_TO_SAVE_A_LIFE_246", "The Fray", "How to Save a Life", DateTime(2024, 6, 11)), 
    _songStub("KINGS_OF_LEON_SEX_ON_FIRE_247", "Kings of Leon", "Sex on Fire", DateTime(2024, 7, 14)), 
    _songStub("YEAH_YEAH_YEAHS_MAPS_248", "Yeah Yeah Yeahs", "Maps", DateTime(2024, 8, 17)), 
    _songStub("PHOENIX_1901_249", "Phoenix", "1901", DateTime(2024, 9, 20)), 
    _songStub("THE_POSTAL_SERVICE_SUCH_GREAT_HEIGHTS_250", "The Postal Service", "Such Great Heights", DateTime(2024, 10, 23)), 
    _songStub("THE_SMASHING_PUMPKINS_1979_251", "The Smashing Pumpkins", "1979", DateTime(2024, 11, 26)), 
    _songStub("PIXIES_WHERE_IS_MY_MIND_252", "Pixies", "Where Is My Mind?", DateTime(2024, 12, 1)), 
    _songStub("BLUR_SONG_2_253", "Blur", "Song 2", DateTime(2024, 1, 4)), 
    _songStub("GORILLAZ_FEEL_GOOD_INC_254", "Gorillaz", "Feel Good Inc.", DateTime(2024, 2, 7)), 
    _songStub("JAMIROQUAI_VIRTUAL_INSANITY_255", "Jamiroquai", "Virtual Insanity", DateTime(2024, 3, 10)), 
    _songStub("MASSIVE_ATTACK_TEARDROP_256", "Massive Attack", "Teardrop", DateTime(2024, 4, 13)), 
    _songStub("PORTISHEAD_GLORY_BOX_257", "Portishead", "Glory Box", DateTime(2024, 5, 16)), 
    _songStub("ENYA_ONLY_TIME_258", "Enya", "Only Time", DateTime(2024, 6, 19)), 
    _songStub("ENIGMA_SADENESS_PART_I_259", "Enigma", "Sadeness (Part I)", DateTime(2024, 7, 22)), 
    _songStub("YIRUMA_RIVER_FLOWS_IN_YOU_260", "Yiruma", "River Flows in You", DateTime(2024, 8, 25)), 
    _songStub("LUDOVICO_EINAUDI_NUVOLE_BIANCHE_261", "Ludovico Einaudi", "Nuvole Bianche", DateTime(2024, 9, 28)), 
    _songStub("CRANBERRIES_I_STILL_DO_262", "Cranberries", "I Still Do", DateTime(2024, 10, 3)), 
    _songStub("TAYLOR_SWIFT_ANTI_HERO_263", "Taylor Swift", "Anti-Hero", DateTime(2024, 11, 6)), 
    _songStub("TAYLOR_SWIFT_BLANK_SPACE_264", "Taylor Swift", "Blank Space", DateTime(2024, 12, 9)), 
    _songStub("TAYLOR_SWIFT_SHAKE_IT_OFF_265", "Taylor Swift", "Shake It Off", DateTime(2024, 1, 12)), 
    _songStub("TAYLOR_SWIFT_LOVE_STORY_266", "Taylor Swift", "Love Story", DateTime(2024, 2, 15)), 
    _songStub("ED_SHEERAN_SHAPE_OF_YOU_267", "Ed Sheeran", "Shape of You", DateTime(2024, 3, 18)), 
    _songStub("ED_SHEERAN_PERFECT_268", "Ed Sheeran", "Perfect", DateTime(2024, 4, 21)), 
    _songStub("ED_SHEERAN_BAD_HABITS_269", "Ed Sheeran", "Bad Habits", DateTime(2024, 5, 24)), 
    _songStub("ED_SHEERAN_THINKING_OUT_LOUD_270", "Ed Sheeran", "Thinking Out Loud", DateTime(2024, 6, 27)), 
    _songStub("THE_WEEKND_BLINDING_LIGHTS_271", "The Weeknd", "Blinding Lights", DateTime(2024, 7, 2)), 
    _songStub("THE_WEEKND_SAVE_YOUR_TEARS_272", "The Weeknd", "Save Your Tears", DateTime(2024, 8, 5)), 
    _songStub("THE_WEEKND_STARBOY_273", "The Weeknd", "Starboy", DateTime(2024, 9, 8)), 
    _songStub("DRAKE_GOD_S_PLAN_274", "Drake", "God's Plan", DateTime(2024, 10, 11)), 
    _songStub("DRAKE_HOTLINE_BLING_275", "Drake", "Hotline Bling", DateTime(2024, 11, 14)), 
    _songStub("ADELE_HELLO_276", "Adele", "Hello", DateTime(2024, 12, 17)), 
    _songStub("ADELE_ROLLING_IN_THE_DEEP_277", "Adele", "Rolling in the Deep", DateTime(2024, 1, 20)), 
    _songStub("ADELE_SOMEONE_LIKE_YOU_278", "Adele", "Someone Like You", DateTime(2024, 2, 23)), 
    _songStub("BILLIE_EILISH_BAD_GUY_279", "Billie Eilish", "bad guy", DateTime(2024, 3, 26)), 
    _songStub("BILLIE_EILISH_HAPPIER_THAN_EVER_280", "Billie Eilish", "Happier Than Ever", DateTime(2024, 4, 1)), 
    _songStub("BTS_DYNAMITE_281", "BTS", "Dynamite", DateTime(2024, 5, 4)), 
    _songStub("BTS_BUTTER_282", "BTS", "Butter", DateTime(2024, 6, 7)), 
    _songStub("OLIVIA_RODRIGO_DRIVERS_LICENSE_283", "Olivia Rodrigo", "drivers license", DateTime(2024, 7, 10)), 
    _songStub("OLIVIA_RODRIGO_GOOD_4_U_284", "Olivia Rodrigo", "good 4 u", DateTime(2024, 8, 13)), 
    _songStub("OLIVIA_RODRIGO_VAMPIRE_285", "Olivia Rodrigo", "vampire", DateTime(2024, 9, 16)), 
    _songStub("DUA_LIPA_LEVITATING_286", "Dua Lipa", "Levitating", DateTime(2024, 10, 19)), 
    _songStub("DUA_LIPA_DON_T_START_NOW_287", "Dua Lipa", "Don't Start Now", DateTime(2024, 11, 22)), 
    _songStub("HARRY_STYLES_AS_IT_WAS_288", "Harry Styles", "As It Was", DateTime(2024, 12, 25)), 
    _songStub("HARRY_STYLES_WATERMELON_SUGAR_289", "Harry Styles", "Watermelon Sugar", DateTime(2024, 1, 28)), 
    _songStub("POST_MALONE_CIRCLES_290", "Post Malone", "Circles", DateTime(2024, 2, 3)), 
    _songStub("POST_MALONE_ROCKSTAR_291", "Post Malone", "Rockstar", DateTime(2024, 3, 6)), 
    _songStub("POST_MALONE_SUNFLOWER_292", "Post Malone", "Sunflower", DateTime(2024, 4, 9)), 
    _songStub("IMAGINE_DRAGONS_BELIEVER_293", "Imagine Dragons", "Believer", DateTime(2024, 5, 12)), 
    _songStub("IMAGINE_DRAGONS_THUNDER_294", "Imagine Dragons", "Thunder", DateTime(2024, 6, 15)), 
    _songStub("IMAGINE_DRAGONS_RADIOACTIVE_295", "Imagine Dragons", "Radioactive", DateTime(2024, 7, 18)), 
    _songStub("JUSTIN_BIEBER_SORRY_296", "Justin Bieber", "Sorry", DateTime(2024, 8, 21)), 
    _songStub("JUSTIN_BIEBER_PEACHES_297", "Justin Bieber", "Peaches", DateTime(2024, 9, 24)), 
    _songStub("RIHANNA_UMBRELLA_298", "Rihanna", "Umbrella", DateTime(2024, 10, 27)), 
    _songStub("RIHANNA_DIAMONDS_299", "Rihanna", "Diamonds", DateTime(2024, 11, 2)), 
    _songStub("BRUNO_MARS_UPTOWN_FUNK_300", "Bruno Mars", "Uptown Funk", DateTime(2024, 12, 5)), 
  ]),
]);

Future<Transport> stubTransport() => Future.value(TransportStub());
Future<Transport> platformTransport() => Future.value(TransportStub());