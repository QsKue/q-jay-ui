import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:qjay/widgets/navigation_bar/bottom_navigation_bar.dart';
import 'package:qjay/widgets/player_bar/player_bar_compact.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_selection.dart';
import 'package:qjay/widgets/preset_view/preset_view_theme.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

class SelectionMobile extends StatefulWidget {
  const SelectionMobile({super.key});

  @override
  State<SelectionMobile> createState() => _SelectionMobileState();
}

class _SelectionMobileState extends State<SelectionMobile> implements PresetViewDataSource {
  late List<SongListColumn> _columns = [];

  @override
  void didChangeDependencies() {
    _columns = [ SongListColumn.play, SongListColumn.track, SongListColumn.pinned];

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
  Future<void> prefetchRange(int start, int count, {Object? sortKey})
    => mounted ? context.read<SelectionPageStore>().getSelectionSongs(start, count) : Future.value();

  @override
  Widget build(BuildContext context) {
    final selection = context.select<SelectionPageStore, Selection?>((store) => store.selection);
    final energies = context.select<SelectionPageStore, List<int>>((store) => store.energies);
    
    final playerState = context.select<PlayerStore, PlayerState>((store) => store.playerState);
    final currentPreset = context.select<PlayerStore, (PresetType, String)?>((store) => store.currentPreset);
    final currentPresetDetails = context.select<PlayerStore, List<int>?>((store) => store.currentPresetDetails);

    final isCurrentSelection = (currentPreset?.$1 == PresetType.selection) && (currentPreset?.$2 == selection?.id);
    final isCurrentEnergies = isCurrentSelection && (currentPresetDetails?.join('-') == energies.join('-'));
    final isPlaying = isCurrentEnergies && (playerState == PlayerState.playing);
    
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final appBarIcon = selection == null ? QJay.qs_logo : selection.icon;
    final title = selection == null ? "" : "${selection.category} / ${selection.name}";
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isCurrentSelection ? colorScheme.primary.withValues(alpha: 0.16) : null,
        leading: NavigationBackButton(icon: appBarIcon),
        titleSpacing: 0,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text(title, style: themeData.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ))
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton.filled(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorScheme.primaryContainer),
                iconColor: WidgetStatePropertyAll(colorScheme.onPrimary),
              ),
              icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
              onPressed: () {
                if (selection == null) return;

                if (isCurrentEnergies) {
                  if (isPlaying) {
                    context.read<PlayerStore>().pause();
                  } else {
                    context.read<PlayerStore>().play();
                  }
                } else {
                  context.read<SelectionPageStore>().setSelection(selection.id, energies);
                }
              },
              // isActive: true,
            ),
          ),
        ],
      ),

      body: Builder(builder: (context) {
        
        final presetViewTheme = Theme.of(context).extension<PresetViewTheme>() ?? PresetViewTheme();

        final selectionToken = context.select<SelectionPageStore, int>((store) => store.selectionToken);
        final songCount = context.select<SelectionPageStore, int>((store) => store.songList.length);
        // final songDuration = context.select<SelectionPageStore, SongDuration>((store) => store.songDuration);
        final sortMode = context.select<SelectionPageStore, SongSortMode>((store) => store.sortMode);
        
        return Column(
          children: [
            
            selection == null
              ? const Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                child: PresetView(
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
                          energies: selection.availableEnergies, defaultEnergies: energies,
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
                ),
              ),

            PlayerBarCompact(),
          ]
        );
      }),

      bottomNavigationBar: AppBottomNavigationBar(index: 0),
    );
  }
}