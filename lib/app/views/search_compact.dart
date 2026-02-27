import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:qjay/widgets/navigation_bar/bottom_navigation_bar.dart';
import 'package:qjay/widgets/player_bar/player_bar_compact.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

const _defaultColumns = [SongListColumn.play, SongListColumn.track, SongListColumn.pinned];

class SearchCompact extends StatefulWidget {
  const SearchCompact({super.key});

  @override
  State<SearchCompact> createState() => _SearchCompactState();
}

class _SearchCompactState extends State<SearchCompact> implements PresetViewDataSource {
  TextEditingController _searchController = TextEditingController();

  @override Object sourceId(BuildContext context) {
    final query = context.read<SearchPageStore>().currentQuery;
    return "search_desktop-$query";
  }
  
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
    => context.read<SearchPageStore>().getSearchSongs(_searchController.text, start, count);

  @override
  Widget build(BuildContext context) {
    
    final buildToken = context.select<SearchPageStore, int>((store) => store.searchToken);
    final songCount = context.select<SearchPageStore, int>((store) => store.songList.length);
    
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(),
        titleSpacing: 0,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: TextField(
              controller: _searchController,
              onChanged: (text) {
                context.read<SearchPageStore>().search(text);
                setState(() {});
              },
              style: themeData.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration.collapsed(
                hintText: 'Search...',
                hintStyle: themeData.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6)
                ),
              ),
            ),
          ),
        ),
      ),

      body: Builder(builder: (context) {

        return Column(
          children: [
            Expanded(
              child: _searchController.text.isEmpty
                ? SizedBox()
                : PresetView(
                  dataSource: this,
                  builderKey: "search-view-token-$buildToken",
                  chunkSize: 4,
                  overscanChunks: 2,
                  itemCount: songCount,
                )
            ),

            PlayerBarCompact(),
          ]
        );
      }),

      bottomNavigationBar: AppBottomNavigationBar(index: 2),
    );
  }
}