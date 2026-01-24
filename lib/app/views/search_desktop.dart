import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/app/store/page_pinned_store.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/app/theme/app_responsive_scope.dart';
import 'package:qjay/app/theme/theme_controller.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_header.dart';
import 'package:qjay/widgets/preset_view/preset_view.dart';
import 'package:qjay/widgets/preset_view/preset_view_delegates.dart';
import 'package:qjay/widgets/song_list/song_list.dart';
import 'package:qjay/widgets/song_list/song_list_types.dart';

class SearchDesktop extends StatefulWidget {
  const SearchDesktop({super.key});

  @override
  State<SearchDesktop> createState() => _SearchDesktopState();
}

class _SearchDesktopState extends State<SearchDesktop> implements PresetViewDataSource, PresetViewDragDataDelegate {
  late List<SongListColumn> _columns = [];
  late List<SongColumn> _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];

  @override
  void didChangeDependencies() {
    _columns = [ SongListColumn.play, SongListColumn.track, SongListColumn.banned];

    switch (context.layout) {
      case AppLayout.wide:
        if (context.screenWidth > 1920) {
          _columnsLegacy = [SongColumn.played, SongColumn.title, SongColumn.artist, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
        } else {
          _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
        }
        break;
      case AppLayout.large:
        switch (ThemeController.of(context).scaleFactor) {
          case ScaleFactor.small:
            _columnsLegacy = [SongColumn.played, SongColumn.title, SongColumn.artist, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
            break;
          case ScaleFactor.medium:
          if (context.screenWidth > 1240) {
            _columnsLegacy = [SongColumn.played, SongColumn.title, SongColumn.artist, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
          } else {
            _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
          }
          case ScaleFactor.large:
            if (context.screenWidth > 1320) {
              _columnsLegacy = [SongColumn.played, SongColumn.title, SongColumn.artist, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
            } else {
              _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
            } 
          break;
          default:
            _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
        }
      default:
        _columnsLegacy = [SongColumn.played, SongColumn.track, SongColumn.dateAdded, SongColumn.banned, SongColumn.pinned];
    }
    super.didChangeDependencies();
  }

  @override Object sourceId(BuildContext context) {
    final query = context.read<SearchPageStore>().currentQuery;
    return "search_desktop-$query";
  }
  
  @override
  Widget itemAtIndex(BuildContext context, int index) {
    return SongListRow<SearchPageStore>(
      index: index,
      columns: _columns,
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
  Future<void> prefetchRange(int start, int count, {Object? sortKey}) async {
    context.read<SearchPageStore>().getSearchSongs("DD", start, count);
  }

  @override
  String labelForIndex(BuildContext context, int index) {
    final song = context.read<SearchPageStore>().songList.elementAtOrNull(index);

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
    return context.read<SearchPageStore>().songList.elementAtOrNull(index);
  }

  @override
  Widget build(BuildContext context) {

    final isLoading = context.select<SearchPageStore, bool>((store) => store.results == null);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final songCount = context.select<SearchPageStore, int>((store) => store.songList.length);

    return PresetView(
      // theme: theme?.presetViewTheme,
      header: PresetBannerHeader(header: "Search Results"),
      dataSource: this,
      dragDataDelegate: this,
      itemCount: songCount,
      pinned: Padding(
        padding: EdgeInsets.zero,
        // child: SongListHeader(
        //   theme: theme?.songListTheme,
        //   columns: _columns,
        // ),
      ),
    );
  }
}