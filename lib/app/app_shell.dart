import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/views/pinned_view.dart';
import 'package:window_manager/window_manager.dart';

import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/store/nav_rail_store.dart';
import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/widgets/button/back_button.dart';
// import 'package:qjay/widgets/chip_holder/chip_holder.dart';
// import 'package:qjay/widgets/chip_holder/chip_holder_theme.dart';
import 'package:qjay/widgets/nav_rail/nav_rail.dart';
import 'package:qjay/widgets/navigation_bar/bottom_navigation_bar.dart';
import 'package:qjay/widgets/player_bar/player_bar_compact.dart';

enum ShellMode {
  empty, compact, basic, expanded;

  static ShellMode fromScreenSize(ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.compact:
        return compact;
      case ScreenSize.medium:
      return basic;
      default:
        return expanded;
    }
  }
}

class AppShell extends StatelessWidget {
  final ShellMode? shellMode;

  final IconData? navIcon;
  final bool? navIconAlwaysVisible;
  final VoidCallback? navAction;

  final Widget? title;
  final Widget body;
  final int? navigationIndex;

  const AppShell({
    super.key,
    this.shellMode,
    this.navIcon,
    this.navIconAlwaysVisible,
    this.navAction,
    this.title,
    required this.body,
    this.navigationIndex,
  });

  Widget shellBody(BuildContext context) {
    final mode = shellMode ?? ShellMode.fromScreenSize(context.screenSize);
    if (mode == ShellMode.empty) return body;

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    // final chipTheme = Theme.of(context).extension<ChipHolderTheme>() ?? ChipHolderTheme();

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
                  
              Expanded(
                child: Row(
                  children: [
                  
                    if (mode != ShellMode.compact)
                      Consumer<NavRailStore>(
                        builder: (context, navRailStore, _) {
                  
                          final playingPresetId = context.select<PlayerStore, String?>((store) => store.currentPreset?.$2);
                  
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: colorScheme.outlineVariant,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: 208,
                                child: Column(
                                  children: [
                                    // ChipHolder(
                                    //   theme: chipTheme.copyWith(gutterPadding: EdgeInsets.all(0)),
                                    //   items: navRailStore.filters,
                                    //   activeItems: navRailStore.activeFilters,
                                    //   onActivate: navRailStore.activateFilter,
                                    //   onDeactivate: navRailStore.deactivateFilter,
                                    //   labelBuilder: (filter) => filter.name,
                                    // ),
                                                
                                    Expanded(
                                      child: NavRail(
                                        children: navRailStore.presets.map(
                                          (preset) => NavRailItem(
                                            icon: preset.icon,
                                            hoverIcon: Icons.play_arrow,
                                            title: preset.name,
                                            subtitle: preset.category,
                                            onPressed: () => context.read<NavigationStore>().gotoPreset(context, preset),
                                            onIconPressed: () => context.read<NavigationStore>().setPreset(preset),
                                            isPlaying: playingPresetId == preset.id,
                                            isActive: playingPresetId == preset.id,
                                          ),
                                        ).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                  
                    Expanded(child: body),

                    if (mode == ShellMode.expanded)
                      Consumer<NavRailStore>(
                        builder: (context, navRailStore, _) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: colorScheme.outlineVariant, // or outline
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: 320,
                                child: Column(
                                  children: [
                                    Text(
                                      "Pinned List",
                                      style: themeData.textTheme.headlineSmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(child: PinnedView()),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                  ],
                ),
              ),
            
              PlayerBarCompact(),
            ],
          ),
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final mode = shellMode ?? ShellMode.fromScreenSize(context.screenSize);
    final showBottomNav = mode == ShellMode.compact || mode == ShellMode.basic;

    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(icon: navIcon, onPressed: navAction, iconAlwaysVisible: navIconAlwaysVisible ?? false),
        titleSpacing: 0,
        title: (mode != ShellMode.empty && (Platform.isWindows || Platform.isLinux || Platform.isMacOS))
          ? Row(
              children: [
                Expanded(
                  child: _WindowDragArea(
                    SizedBox(height: kToolbarHeight, child: const ColoredBox(color: Colors.transparent)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 400,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.outlineVariant,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        onChanged: (text) {
                          context.read<SearchPageStore>().search(text);
                        },
                        style: themeData.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search...',
                          hintStyle: themeData.textTheme.labelLarge?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: _WindowDragArea(
                    SizedBox(height: kToolbarHeight, child: const ColoredBox(color: Colors.transparent)),
                  ),
                ),
              ],
            )
          : title,
        actions: [
          if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) ...[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => windowManager.minimize(),
            ),
            IconButton(
              icon: const Icon(Icons.crop_square),
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  await windowManager.unmaximize();
                } else {
                  await windowManager.maximize();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => windowManager.close(),
            ),
          ],
        ],
      ),
      body: shellBody(context),
      bottomNavigationBar: navigationIndex != null && showBottomNav ? AppBottomNavigationBar(index: navigationIndex!) : null,
    );
  }
}

class _WindowDragArea extends StatelessWidget {
  final Widget child;
  const _WindowDragArea(this.child);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) async {
        print("AA");
        if (await windowManager.isMaximized()) return;
        await windowManager.startDragging();
      },
      child: child,
    );
  }
}