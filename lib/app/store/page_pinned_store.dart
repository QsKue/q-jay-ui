import 'package:flutter/material.dart';

import 'package:qjay/models/song.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:qjay/widgets/song_list/song_list.dart';

class PinnedPageStore with ChangeNotifier implements SongListProvider {
  final Transport _transport;

  PinnedPageStore(this._transport);

  List<Song?> _pinnedSongs = [];
  @override List<Song?> get songList => _pinnedSongs;

  void load() {
    _transport.getPinnedCount().then((result) {
      result.handle(
        onSuccess: (value) {
          _pinnedSongs = List.generate(value, (_) => null);
          notifyListeners();
        },
      );
    });
  }

  int _pinnedToken = 0;
  Future<void> getPinnedSongs(int offset, int count) async {
    final requestToken = _pinnedToken;

    final result = await _transport.getPinnedSongs(offset, count);
    result.handle(
      onSuccess: (songs) {
        if (requestToken != _pinnedToken) return;

        for (int i = 0; i < songs.songInfo.length; i++) {
          _pinnedSongs[songs.startIndex + i] = songs.songInfo[i];
        }

        notifyListeners();
      },
    );
  }

  bool _pinnedSongsFree = true;
  void addPinnedSong(Song song, [int? insertIndex]) {
    if (_pinnedSongs.indexWhere((pinnedSong) => pinnedSong?.id == song.id) != -1) {
      return;
    }

    if (!_pinnedSongsFree) { return; }
    _pinnedSongsFree = false;
    
    final index = insertIndex ?? _pinnedSongs.length;
    _transport.addPinnedSong(index, song).then((result) {
      result.handle(
        onSuccess: (value) {
          _transport.sendEvent(TransportEventSongPinnedUpdated(song.id, true));
          _pinnedSongs.insert(index, song);

          notifyListeners();  
        },
      );

      _pinnedSongsFree = true;
    });
  }

  void reorderPinnedSongs(int from, int to) {
    if (!_pinnedSongsFree) { return; }
    _pinnedSongsFree = false;

    _transport.reorderPinnedSongs(from, to).then((result) {
      result.handle(
        onSuccess: (value) {
          final item = _pinnedSongs.removeAt(from);
          final insertIndex = (from < to) ? to - 1 : to;

          _pinnedSongs.insert(insertIndex, item);

          notifyListeners();  
        },
      );

      _pinnedSongsFree = true;
    });
  }

  void removePinnedSong(String songId) {
    if (!_pinnedSongsFree) return;
    _pinnedSongsFree = false;

    _transport.deletePinnedSong(songId).then((result) {
      result.handle(
        onSuccess: (index) {
          if (index != -1) {
            _transport.sendEvent(TransportEventSongPinnedUpdated(songId, false));
            _pinnedSongs.removeAt(index);
            notifyListeners();
          }
        },
      );

      _pinnedSongsFree = true;
    });
  }

  @override
  void dispose() {
    _pinnedToken++;
    super.dispose();
  }
}