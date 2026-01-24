import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qjay/app/navigator.dart';
import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/page_search_store.dart';

import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/app/store/nav_rail_store.dart';
import 'package:qjay/app/theme/app_responsive_scope.dart';
import 'package:qjay/app/theme/theme_controller.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/widgets/chip_holder/chip_holder.dart';
import 'package:qjay/widgets/nav_rail/nav_rail.dart';
import 'package:qjay/app/views/pinned.dart';
import 'package:qjay/widgets/player_bar/player_bar.dart';
import 'package:qjay/widgets/resizable_three_columns.dart';
import 'package:qjay/widgets/side_list/side_list.dart';
import 'package:qjay/widgets/side_list/side_list_theme.dart';
import 'package:qjay/widgets/title_bar/title_bar.dart';

class AppNavigator extends StatefulWidget {
  final ThemeController themeController;

  const AppNavigator({
    super.key,
    required this.themeController,
  });

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  bool _rightCollapsed = true;

  final _searchNode  = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final presets = context.read<NavRailStore>().presets;
      context.read<NavigationStore>().gotoPreset(context, presets[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaleFactor = ThemeController.of(context).scaleFactor;

    final collapsible = context.screenWidth > 760;
    final rightCollapsed = !collapsible || _rightCollapsed;
    
    return Scaffold(
      bottomNavigationBar: const _PlayerBarSection(),
      
      body: Column(
        children: [
          Consumer<SearchPageStore>(
            builder: (context, searchStore, __) {
              return TitleBar(
                focusNode: _searchNode,
                leftIcon: Icon(QJay.qs_logo),
                onSearchChanged: (query) {
                  if (query.isEmpty) return;
                            
                  final nav = context.read<NavigationStore>();
                  if (ModalRoute.of(context)?.settings.name != Routes.search) {
                    nav.gotoPage(context, Routes.search);
                  }
              
                  searchStore.search(query);

                  WidgetsBinding.instance.addPostFrameCallback((_) => _searchNode.requestFocus());
                },
              );
            }
          ),
          
          // Expanded(
          //   child: ResizableThreeColumns(
          //     center: ContentNavigator(),
          //     initialLeft: 200,
          //     minLeft: theme?.navRailMinSize.scaleForLayout(scaleFactor) ?? 200,
          //     maxLeft: theme?.navRailMaxSize.scaleForLayout(scaleFactor) ?? 300,
          //     leftBuilder: (w) => _NavRailSection(width: w),
              
          //     handleHitWidth: 4,
          //     handleLineWidth: 1,
      
          //     initialRight: 200,
          //     minRight: theme?.sidelistMinSize.scaleForLayout(scaleFactor) ?? 200,
          //     maxRight: theme?.sidelistMaxSize.scaleForLayout(scaleFactor) ?? 300,
          //     rightCollapsed: rightCollapsed,
          //     rightCollapsedWidth: theme?.sidelistCollapsedSize.scaleForLayout(scaleFactor) ?? 56,
          //     rightBuilder: (w) => _SideListSection(width: w, collapsible: collapsible, collapsed: rightCollapsed, onCollapsedChanged: (v) {
          //       setState(() => _rightCollapsed = v);
          //     }),
          //     onRightCollapsedChanged: (v) {
          //       setState(() => _rightCollapsed = v);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchNode.dispose();
    super.dispose();
  }
}

class _PlayerBarSection extends StatelessWidget {
  const _PlayerBarSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerStore>(
      builder: (context, playerStore, __) {

        final (runningTime, remainingTime) = (playerStore.runningTime, playerStore.totalTime);

        return PlayerBar(
          presetInfo: playerStore.currentPreset?.$1,
          song: playerStore.currentSong,
          onView: () {
            if (playerStore.currentPreset == null) return;
            context.read<NavigationStore>().gotoPage(context, playerStore.currentPreset!.$1.route, playerStore.currentPreset!.$2);
          },
          onDownvote: (song) => playerStore.addToExceptions(song, true),
          onSeek: (percentage) => playerStore.setProgress(percentage),
          isPlaying: playerStore.playerState == PlayerState.playing,
          onPlay: () => playerStore.play(),
          onPause: () => playerStore.pause(),
          onStop: () => playerStore.stop(),
          onNext: () => playerStore.next(),
          volume: playerStore.volume ?? 1,
          progress: runningTime == null || remainingTime == null ? 0 : runningTime.inSeconds.toDouble() / remainingTime.inSeconds.toDouble(),
          runningTime: playerStore.runningTime,
          remainingTime: playerStore.totalTime,
          onVolumeChanged: (double volume) => playerStore.setVolume(volume),
        );
      }
    );
  }
}

class _SideListSection extends StatelessWidget {
  final double width;
  final bool collapsible;
  final bool collapsed;
  final ValueChanged<bool> onCollapsedChanged;
  const _SideListSection({required this.width, required this.collapsible, required this.collapsed, required this.onCollapsedChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SideListTheme>()
      ?? SideListTheme.fromBrightness(Theme.of(context).brightness);

    return SideList(
      theme: theme,
      width: width,
      pages: const [SideListPage.favorites, SideListPage.settings],
      initialCollapsed: false,
      collapsible: collapsible,
      collapsed: collapsible && collapsed,
      onCollapsedChanged: onCollapsedChanged,
      iconForPage: (page) => page.icon,
      contentForPage: (page) {
        switch (page) {
          case SideListPage.favorites:
            return const PinnedPage();
          case SideListPage.userPlaylists:
            return Text(page.name);
          case SideListPage.settings:
            return Text(page.name);
        }
      },
      tooltipForPage: (page) => page.label,
    );
  }
}

class _NavRailSection extends StatelessWidget {
  final double width;
  const _NavRailSection({required this.width});

  @override
  Widget build(BuildContext context) {

    final playingPresetId = context.select<NavigationStore, String?>((store) => store.currentPresetId);

    return Consumer<NavRailStore>(
      builder: (context, navRailStore, _) {
        return NavRail(
          width: width,
          headerWidgets: [
            if (navRailStore.filters.length > 1)
              ChipHolder(
                items: navRailStore.filters,
                activeItems: navRailStore.activeFilters,
                onActivate: navRailStore.activateFilter,
                onDeactivate: navRailStore.deactivateFilter,
                labelBuilder: (filter) => filter.name,
              ),
          ],
          children: navRailStore.presets.map(
            (preset) => NavRailItem(
              icon: preset.icon,
              hoverIcon: Icons.play_arrow,
              title: preset.name,
              subtitle: preset.category,
              onPressed: () => context.read<NavigationStore>().gotoPreset(context, preset),
              onIconPressed: () => context.read<NavigationStore>().setPreset(preset),
              isPlaying: navRailStore.currentPreset?.id == preset.id,
              isActive: playingPresetId == preset.id,
            ),
            // (preset) => NavRailPlaceholderItem(),
          ).toList(),
        );
      },
    );
  }
}