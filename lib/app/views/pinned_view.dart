import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

class PinnedView extends StatelessWidget implements PresetViewDataSource, PresetViewReorderDelegate {
  final _defaultColumns = const [SongListColumn.play, SongListColumn.track, SongListColumn.remove];

  const PinnedView({super.key});

  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return SongListRow<PinnedPageStore>(
      index: index,
      columns: _defaultColumns,
      onCellTap: (column) {
        switch (column) {
          case SongListColumn.play:
            final song = context.read<PinnedPageStore>().songList.elementAtOrNull(index);
            if (song == null) return;
      
            context.read<PlayerStore>().skipToSong(song);
            break;
          case SongListColumn.remove:
            final song = context.read<PinnedPageStore>().songList.elementAtOrNull(index);
            if (song == null) return;
    
            context.read<PinnedPageStore>().removePinnedSong(song.id);
            break;
          default:
            return;
        }
      },
    );
  }

  @override
  Future<void> prefetchRange(BuildContext context, int start, int count, {Object? sortKey})
    => context.read<PinnedPageStore>().getPinnedSongs(start, count);

  @override
  Object sourceId(BuildContext context) {
    final songLength = context.read<PinnedPageStore>().songList.length;
    return "pinned-preset-view-$songLength";
  }

  @override
  String labelForIndex(BuildContext context, int index) {
    final song = context.read<PinnedPageStore>().songList[index];
    if (song == null) {
      return "Song...";
    }
    return "${song.artist}\n${song.title}";
  }

  @override
  void onReorderRequested(BuildContext context, int oldIndex, int newIndex) {
    context.read<PinnedPageStore>().reorderPinnedSongs(oldIndex, newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final songCount = context.select<PinnedPageStore, int>((store) => store.songList.length);

    return PresetView(
      dataSource: this,
      reorderDelegate: this,
      chunkSize: 4,
      overscanChunks: 2,
      itemCount: songCount,
    );
  }
}