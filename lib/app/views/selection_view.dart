import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_selection.dart';
import 'package:qjay/widgets/preset_view/preset_view_theme.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

class SelectionView extends StatelessWidget implements PresetViewDataSource {
  final List<SongListColumn> _columns = const [ SongListColumn.play, SongListColumn.track, SongListColumn.pinned];

  final Selection selection;
  final SongSortMode sortMode;

  const SelectionView({
    super.key,
    required this.selection,
    required this.sortMode,
  });

  @override Object sourceId(BuildContext context)
    => "selection_view-${selection.defaultEnergies.join("-")}-${sortMode.index}";
  
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
  Future<void> prefetchRange(BuildContext context, int start, int count, {Object? sortKey})
    => context.read<SelectionPageStore>().getSelectionSongs(start, count);

  @override
  Widget build(BuildContext context) {
    final presetViewTheme = Theme.of(context).extension<PresetViewTheme>() ?? PresetViewTheme();

    final currentPreset = context.select<PlayerStore, (PresetType, String)?>((store) => store.currentPreset);
    final currentPresetDetails = context.select<PlayerStore, List<int>?>((store) => store.currentPresetDetails);
    final isCurrentSelection = (currentPreset?.$1 == PresetType.selection) && (currentPreset?.$2 == selection.id);
    
    final selectionToken = context.select<SelectionPageStore, int>((store) => store.selectionToken);
    final songCount = context.select<SelectionPageStore, int>((store) => store.songList.length);
    
    return PresetView(
      theme: presetViewTheme.copyWith(rowSpacing: 0),
      dataSource: this,
      builderKey: "selection-view-token-$selectionToken",
      itemCount: songCount,
      chunkSize: 4,
      overscanChunks: 2,
      pinned: Column(
        children: [
          
          if (selection.availableEnergies.length > 1)
            PresetBannerSelection(
              currentEnergies: isCurrentSelection ? currentPresetDetails ?? [] : [],
              energies: selection.availableEnergies, defaultEnergies: selection.defaultEnergies,
              onSelectionChanged: (selectedEnergies, songDuration) {
                context.read<SelectionPageStore>().refreshSelection(energies: selectedEnergies, sortMode: sortMode, songDuration: songDuration);
              },
            ),

          SongListHeader(
            sortMode: sortMode,
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