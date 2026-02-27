import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

const _defaultColumns = [SongListColumn.play, SongListColumn.track, SongListColumn.pinned];

class SearchView extends StatelessWidget implements PresetViewDataSource {
  final String query;

  const SearchView({
    super.key,
    required this.query,
  });

  @override Object sourceId(BuildContext context) => "search_desktop-$query";
  
  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return SongListRow<SearchPageStore>(
      index: index,
      columns: _defaultColumns,
      onCellTap: (column) {
        switch(column) {
          case SongListColumn.play:
            final song = context.read<SearchPageStore>().songList.elementAtOrNull(index);
            if (song == null) return;

            context.read<PlayerStore>().skipToSong(song);
            break;
          case SongListColumn.pinned:
            final song = context.read<SearchPageStore>().songList.elementAtOrNull(index);
            if (song == null) {
              return;
            }

            if (song.pinned) {
              context.read<PinnedPageStore>().removePinnedSong(song.id);
            } else {
              context.read<PinnedPageStore>().addPinnedSong(song);
            }
          case SongListColumn.banned:
            final song = context.read<SearchPageStore>().songList.elementAtOrNull(index);
            if (song == null) return;

            if (song.banned) {
              context.read<PlayerStore>().removeFromExceptions(song);
            } else {
              final playerCurrentSong = context.read<PlayerStore>().currentSong;
              final skipToNext = song == playerCurrentSong;

              context.read<PlayerStore>().addToExceptions(song, skipToNext);
            }
            break;
          default:
            break;
        }
      }
    );
  }
  
  @override
  Future<void> prefetchRange(BuildContext context, int start, int count, {Object? sortKey})
    => context.read<SearchPageStore>().getSearchSongs(query, start, count);

  @override
  Widget build(BuildContext context) {
    final buildToken = context.select<SearchPageStore, int>((store) => store.searchToken);
    final songCount = context.select<SearchPageStore, int>((store) => store.songList.length);

    return PresetView(
      dataSource: this,
      builderKey: "search-view-token-$buildToken",
      chunkSize: 4,
      overscanChunks: 2,
      itemCount: songCount,
    );
  }
}