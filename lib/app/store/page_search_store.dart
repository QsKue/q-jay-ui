import 'dart:async' show StreamSubscription;

import 'package:flutter/material.dart';

import 'package:qjay/models/song.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:qjay/widgets/song_list/song_list.dart';

class SearchPageStore with ChangeNotifier implements SongListProvider {
  final Transport _transport;

  SearchPageStore(this._transport);

  int _searchToken = 0;
  int get searchToken => _searchToken;

  String? _currentQuery;
  String get currentQuery => _currentQuery ?? "";

  List<Song?>? _results;
  List<Song?>? get results => _results;
  @override List<Song?> get songList => _results ?? [];

  StreamSubscription<TransportEvent>? _sub;

  void load() {
    _startListening();
  }

  void _startListening() {
    _sub?.cancel();
    _sub = _transport.eventStream.listen((event) {
      switch (event) {
        case TransportEventSongPinnedUpdated():
          final song = _results?.firstWhere((song) => song?.id == event.songId, orElse: () => null);
          if (song != null) {
            song.pinned = event.pinned;
            notifyListeners();
          }
          break;
        case TransportEventSongBannedUpdated():
          final song = _results?.firstWhere((song) => song?.id == event.songId, orElse: () => null);
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
  
  String _latestSearch = "";
  void search(String query) {
    query = query.trim();
    if (_latestSearch == query) return;

    _latestSearch = query;

    if (query.isEmpty) {
      _currentQuery = query;
      _searchToken++;
      
      notifyListeners();
      return;
    }

    final latestSerach = _latestSearch;
    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      if (latestSerach != _latestSearch) return;
      if (_currentQuery == _latestSearch) return;
      
      _transport.clearRequests();
      _results = [];
      notifyListeners();

      _transport.searchResultCount(query).then((result) {
        _searchToken++;

        result.handle(
          onSuccess: (value) {
            _currentQuery = query;
            _searchToken++;
            _results = List.generate(value, (_) => null);

            notifyListeners();
          },
        );
      });
    });
  }

  Future<void> getSearchSongs(String query, int startIndex, int count) async {
    if (query != _currentQuery) return;

    final requestToken = searchToken;
    final result = await _transport.searchResultSongs(currentQuery, startIndex, count);

    if (requestToken != searchToken) return;
    if (_currentQuery != query) return;
    if (_results == null) return;
    
    result.handle(
      onSuccess: (songs) {
        for (int i = 0; i < songs.songInfo.length; i++) {
          _results?[songs.startIndex + i] = songs.songInfo[i];
        }

        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    _currentQuery = null;
    super.dispose();
  }
}