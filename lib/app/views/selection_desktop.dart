import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_header.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_selection.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

class SelectionDesktop extends StatefulWidget {
  const SelectionDesktop({super.key});

  @override
  State<SelectionDesktop> createState() => _SelectionDesktopState();
}

class _SelectionDesktopState extends State<SelectionDesktop> implements PresetViewDataSource, PresetViewDragDataDelegate {
  late List<SongListColumn> _columns = [];

  @override
  void didChangeDependencies() {
    _columns = [ SongListColumn.play, SongListColumn.track, SongListColumn.banned];

    super.didChangeDependencies();
  }

  @override Object sourceId(BuildContext context) {
    final energies = context.read<SelectionPageStore>().energies.join("-");
    final sortMode = context.read<SelectionPageStore>().sortMode.index;
    
    return "selection_desktop-$energies-$sortMode";
  }
  
  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return SongListRow<SelectionPageStore>(
      index: index,
      columns: _columns,
      onCellTap: (column) {
        switch(column) {
          case SongListColumn.play:
            final selection = context.read<SelectionPageStore>().selection;
            if (selection == null) return;
            
            final energies = context.read<SelectionPageStore>().energies;
            final song = context.read<SelectionPageStore>().songList[index];
            if (song == null) return;
            
            context.read<SelectionPageStore>().setSelection(selection.id, energies, song.id);
            break;
          case SongListColumn.pinned:
            final song = context.read<SelectionPageStore>().songList.elementAtOrNull(index);
            if (song == null) {
              return;
            }

            if (song.pinned) {
              context.read<PinnedPageStore>().removePinnedSong(song.id);
            } else {
              context.read<PinnedPageStore>().addPinnedSong(song);
            }
          case SongListColumn.banned:
            final song = context.read<SelectionPageStore>().songList.elementAtOrNull(index);
            if (song == null) {
              return;
            }

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
  Future<void> prefetchRange(int start, int count, {Object? sortKey}) async {
    context.read<SelectionPageStore>().getSelectionSongs(start, count);
  }

  @override
  String labelForIndex(BuildContext context, int index) {
    final song = context.read<SelectionPageStore>().songList.elementAtOrNull(index);

    if (song == null) {
      return "Song...";
    }
    return "${song.artist}\n${song.title}";
  }

  @override
  bool canAccept(BuildContext context, Object? dragData) {
    return false;
  }

  @override
  void onExternalDrop(BuildContext context, Object? dragData, int insertIndex) {
    return;
  }

  @override
  Object? dragDataForItem(BuildContext context, int index) {
    return context.read<SelectionPageStore>().songList.elementAtOrNull(index);
  }

  @override
  Widget build(BuildContext context) {

    final selection = context.select<SelectionPageStore, Selection?>((store) => store.selection);
    if (selection == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final songCount = context.select<SelectionPageStore, int>((store) => store.songList.length);
    final energies = context.select<SelectionPageStore, List<int>>((store) => store.energies);
    final songDuration = context.select<SelectionPageStore, SongDuration>((store) => store.songDuration);
    final sortMode = context.select<SelectionPageStore, SongSortMode>((store) => store.sortMode);
    
    return PresetView(
      // theme: theme?.presetViewTheme,
      header: PresetBannerHeader(
        icon: selection.icon,
        header: selection.name,
      ),
      dataSource: this,
      dragDataDelegate: this,
      itemCount: songCount,
      pinned: Column(
        children: [

          PresetBannerSelection(
            currentEnergies: energies,
            energies: selection.availableEnergies, defaultEnergies: selection.defaultEnergies,
            onSelectionChanged: (selectedEnergies, songDuration) {
              context.read<SelectionPageStore>().refreshSelection(energies: selectedEnergies, sortMode: sortMode, songDuration: songDuration);
            },
            onPlay: () => context.read<SelectionPageStore>().setSelection(selection.id, energies),
          ),

          SongListHeader(
            onColumnTap: (column) {
              SongSortMode newSortMode = sortMode;
          
              if (column == SongListColumn.track) {
                if (sortMode == SongSortMode.titleAscending || sortMode == SongSortMode.titleDescending) {
                  newSortMode = sortMode.nextOrder;
                } else {
                  newSortMode = SongSortMode.titleAscending;
                }
              }
          
              if (column == SongListColumn.dateAdded) {
                if (sortMode == SongSortMode.dateAscending || sortMode == SongSortMode.dateDescending) {
                  newSortMode = sortMode.nextOrder;
                } else {
                  newSortMode = SongSortMode.dateAscending;
                }
              }
          
              context.read<SelectionPageStore>().refreshSelection(sortMode: newSortMode);
            },
            columns: _columns,
          ),
        ]
      ),
    );
  }
}