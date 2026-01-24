import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:qjay/widgets/song_list/song_list.dart';

class SelectionPageStore with ChangeNotifier implements SongListProvider {
  final Transport _transport;

  SelectionPageStore(this._transport) : _songs = [];

  int _selectionToken = 0;
  int get selectionToken => _selectionToken;

  Selection? _selection;
  Selection? get selection => _selection;

  List<int>? _energies;
  List<int> get energies => _energies ?? const [4,5];

  SongDuration? _songDuration;
  SongDuration get songDuration => _songDuration ?? SongDuration.fullLength;

  SongSortMode? _sortMode;
  SongSortMode get sortMode => _sortMode ?? SongSortMode.titleAscending;

  List<Song?> _songs;
  @override List<Song?> get songList => _songs;

  StreamSubscription<TransportEvent>? _sub;

  void load(String id, List<int>? energies) {
    _transport.getSelection(id).then((result) {

      result.handle(
        onSuccess: (selection) {
          _selection = selection;
          _energies = energies ?? selection.defaultEnergies;
          _songDuration = SongDuration.fullLength;
          _sortMode = SongSortMode.titleAscending;
          _songs = List.generate(selection.defaultSongCount, (_) => null);
        },
      );

      _startListening();
      notifyListeners();
    });
  }

  void _startListening() {
    _sub?.cancel();
    _sub = _transport.eventStream.listen((event) {
      switch (event) {
        case TransportEventSongPinnedUpdated():
          final song = _songs.firstWhere((song) => song?.id == event.songId, orElse: () => null);
          if (song != null) {
            song.pinned = event.pinned;
            notifyListeners();
          }
          break;
        case TransportEventSongBannedUpdated():
          final song = _songs.firstWhere((song) => song?.id == event.songId, orElse: () => null);
          if (song != null) {
            song.banned = event.banned;
            notifyListeners();
          }
          break;
        default:
          break;
      }
    });
  }

  void setSelection(String selectionId, List<int> energies, [String? startingSongId])
    => _transport.setSelection(selectionId, startingSongId, energies, songDuration).then((result) => result.handle());

  void setSongDuration(SongDuration songDuration) {
    _songDuration = songDuration;
    notifyListeners();
  }

  void refreshSelection({List<int>? energies, SongSortMode? sortMode, SongDuration? songDuration}) {
    
    final selectionId = _selection?.id;
    final newEnergies = energies ?? _energies;
    final newSortMode = sortMode ?? _sortMode;

    _songDuration = songDuration;
    notifyListeners();

    if ((selectionId == null) || (newEnergies == null) || (newSortMode == null)) {
      return;
    }

    if ((newEnergies.join('-') == _energies?.join('-')) && (newSortMode == _sortMode)) {
      return;
    }

    _songs = List.generate(_songs.length, (_) => null);
    _transport.clearRequests();
    notifyListeners();

    _transport.getSelectionCount(selectionId, newEnergies).then((result) {
      _selectionToken ++;

      result.handle(
        onSuccess: (songCount) {
          _energies = newEnergies;
          _sortMode = newSortMode;
          _songs = List.generate(songCount, (_) => null);
          
          notifyListeners();
        },
      );
    });
  }

  Future<void> getSelectionSongs(int startIndex, int count) async {
    final int requestToken = _selectionToken;

    final selection = _selection;
    final energies = _energies;
    if ((selection == null) || (energies == null)) {
      return;
    }

    if (startIndex + count > _songs.length) {
      return; // quick switch between selections with a quick get selection from middle
    }

    int? firstNull;
    int? lastNull;

    for (int i = startIndex; i < startIndex + count; i++) {
      final hasValue = _songs[i] != null;
      if (!hasValue) {
        firstNull ??= i;
        lastNull = i;
      }
    }

    if (firstNull == null || lastNull == null) {
      return;
    }

    startIndex = firstNull;
    count = (lastNull - firstNull) + 1;

    final result = await _transport.getSelectionSongs(selection.id, energies, _sortMode ?? SongSortMode.titleAscending, startIndex, count);
    if (requestToken != _selectionToken) return;
    
    result.handle(
      onSuccess: (selectionSongs) {
        for (int i = 0; i < selectionSongs.songInfo.length; i++) {
          _songs[selectionSongs.startIndex + i] = selectionSongs.songInfo[i];
        }

        notifyListeners();   
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    _selectionToken++;
    super.dispose();
  }
}