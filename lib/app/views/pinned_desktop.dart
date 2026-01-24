import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_theme.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

const _defaultColumns = [SongListColumn.play, SongListColumn.track, SongListColumn.remove];

class PinnedDesktop extends StatefulWidget {

  const PinnedDesktop({super.key});

  @override
  State<PinnedDesktop> createState() => _PinnedDesktopState();
}

class _PinnedDesktopState extends State<PinnedDesktop> implements PresetViewDataSource, PresetViewReorderDelegate, PresetViewDragDataDelegate {
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
  Future<void> prefetchRange(int start, int count, {Object? sortKey})
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
  bool canAccept(BuildContext context, Object? dragData) {
    return dragData is Song ? !dragData.pinned : false;
  }

  @override
  void onExternalDrop(BuildContext context, Object? dragData, int insertIndex) {
    context.read<PinnedPageStore>().addPinnedSong(dragData as Song, insertIndex);
  }

  @override
  Object? dragDataForItem(BuildContext context, int index) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final clampedScale = MediaQuery.of(context).textScaleFactor;
    final pinnedListLength = context.select<PinnedPageStore, int>((state) => state.songList.length);
    
    return PresetView(
      // theme: theme?.presetViewTheme,
      // length: pinnedListLength,
      header: PresetBannerHeader(header: "Pinned List"),
      dataSource: this,
      reorderDelegate: this,
      dragDataDelegate: this,
      itemCount: pinnedListLength,
      // itemKey: (index) => "pinned-preset-view-index-$index|$pinnedListLength",
      // footer: Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.all(8 * clampedScale),
      //       child: Text("Pinned List", textAlign: TextAlign.start, style: theme?.presetViewTheme.headerTextStyle),
      //     ),
      //   ],
      // ),
    );
  }
}