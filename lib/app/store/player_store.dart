import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';

class PlayerStore extends ChangeNotifier {
  final Transport _transport;

  PlayerStore(this._transport);

  (PresetType, String)? _currentPreset;
  (PresetType, String)? get currentPreset => _currentPreset;

  List<int>? _currentPresetDetails;
  List<int>? get currentPresetDetails => _currentPresetDetails;

  PlayerState _playerState = PlayerState.stopped;
  PlayerState get playerState => _playerState;

  Duration? _runningTime;
  Duration? get runningTime => _runningTime;

  Duration? _remainingTime;
  Duration? get totalTime => _remainingTime;

  Song? _currentSong;
  Song? get currentSong => _currentSong;

  double? _volume;
  double? get volume => _volume;

  SongDuration _songDuration = SongDuration.fullLength;
  SongDuration get songDuration => _songDuration;

  StreamSubscription<TransportEvent>? _sub;

  void load() {
    _sub?.cancel();
    _sub = _transport.eventStream.listen((event) {
      switch (event) {
        case TransportEventScheduleUpdated():
          _currentPreset = (PresetType.schedule, event.scheduleId);
          _currentPresetDetails = [event.rotationIndex, event.segmentIndex];

          notifyListeners();
          break;
        case TransportEventSelectionUpdated():
          _currentPreset = (PresetType.selection, event.selectionId);
          _currentPresetDetails = event.energies;
          
          notifyListeners();
          break;
        case TransportEventSongUpdated():
          _currentSong = event.song;
          
          notifyListeners();
          break;
        case TransportEventSongPinnedUpdated():
          if (_currentSong?.id == event.songId) {
            _currentSong?.pinned = event.pinned;
          }

          notifyListeners();
          break;
        case TransportEventStateUpdated():
          _playerState = event.state;

          notifyListeners();
          break;
        case TransportEventProgressUpdated():
          _runningTime = event.runningTime;
          _remainingTime = event.remainingTime;
          
          notifyListeners();
          break;
        default:
          break;
      }
    });

    updateCurrentSong();

    _transport.getCurrentState().then((result) {
      result.handle(
        onSuccess: (state) {
          _playerState = state;
          notifyListeners();
        },
      );
    });

    _transport.getCurrentPreset().then((result) {
      result.handle(
        onSuccess: (presetInfo) {
          switch (presetInfo) {
            case TransportEventScheduleUpdated():
              _currentPreset = (PresetType.schedule, presetInfo.scheduleId);
              _currentPresetDetails = [presetInfo.rotationIndex, presetInfo.segmentIndex];
              notifyListeners();
              break;
            case TransportEventSelectionUpdated():
              _currentPreset = (PresetType.selection, presetInfo.selectionId);
              _currentPresetDetails = presetInfo.energies;
              notifyListeners();
            default:
              return;
          }
          
          notifyListeners();  
        },
      );
    });

    _transport.setupPlayer().then((result) {
      result.handle(
        onSuccess: (value) {
          _transport.getVolume().then((result) {
            result.handle(
              onSuccess: (value) {
                _volume = volume;
              },
            );
          });
        },
      );
    });
  }

  void updateCurrentSong() {
    _transport.getCurrentSong().then((result) {
      result.handle(
        onSuccess: (song) {
          _currentSong = song;
          notifyListeners();
        },
      );
    });
  }

  void play() => _transport.play().then((result) => result.handle());
  void stop() => _transport.stop().then((result) => result.handle());
  void pause() => _transport.pause().then((result) => result.handle());
  void next() => _transport.next().then((result) => result.handle());
  void skipToSong(Song song) => _transport.skipToSong(song.id).then((result) => result.handle());

  void setVolume(double volume) {
    final double volumeClamped = volume.clamp(0, 1);

    _transport.setVolume(volumeClamped).then((result) {
      result.handle(
        onSuccess: (value) {
          _volume = volumeClamped;
          notifyListeners();
        },
      );
    });
  }
 
  void setProgress(double percentage) => _transport.setProgress(percentage).then((result) => result.handle());

  void setSongDuration(SongDuration songDuration) {
    _songDuration = songDuration;
    notifyListeners();

    // TODO: transport set song duration
  }

  void handleStateUpdated(TransportEventStateUpdated event) {
    _playerState = event.state;
    notifyListeners();
  }

  void handleProgressUpdated(TransportEventProgressUpdated event) {
    _runningTime = event.runningTime;
    _remainingTime = event.remainingTime;
    notifyListeners();
  }

  bool _exeptionsFree = true;
  void addToExceptions(Song song, [bool skipToNext = false]) {
    if (!_exeptionsFree) { return; }
    _exeptionsFree = false;

    _transport.addToExceptions(song.id, skipToNext).then((result) {
      result.handle();
      _exeptionsFree = true;
    });
  }

  void removeFromExceptions(Song song) {
    if (!_exeptionsFree) { return; }
    _exeptionsFree = false;

    _transport.removeFromExceptions(song.id).then((result) {
      result.handle();
      _exeptionsFree = true;
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}