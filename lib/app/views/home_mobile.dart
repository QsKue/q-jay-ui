import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/store/nav_rail_store.dart';
import 'package:qjay/app/store/navigation_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:qjay/widgets/chip_holder/chip_holder.dart';
import 'package:qjay/widgets/chip_holder/chip_holder_theme.dart';
import 'package:qjay/widgets/nav_rail/nav_rail.dart';
import 'package:qjay/widgets/navigation_bar/bottom_navigation_bar.dart';
import 'package:qjay/widgets/player_bar/player_bar_compact.dart';

class HomeMobile extends StatelessWidget {

  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final chipTheme = Theme.of(context).extension<ChipHolderTheme>() ?? ChipHolderTheme();
    
    final playingPresetId = context.select<PlayerStore, String?>((store) => store.currentPreset?.$2);
    
    return Consumer<NavRailStore>(
      builder: (context, navRailStore, _) {
        return Scaffold(
          appBar: AppBar(
            leading: NavigationBackButton(icon: QJay.qs_logo),
            title: ChipHolder(
              theme: chipTheme.copyWith(gutterPadding: EdgeInsets.all(0)),
              items: navRailStore.filters,
              activeItems: navRailStore.activeFilters,
              onActivate: navRailStore.activateFilter,
              onDeactivate: navRailStore.deactivateFilter,
              labelBuilder: (filter) => filter.name,
            ),
          ),
        
          body: Column(
            children: [
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

              PlayerBarCompact(),
            ]
          ),
          bottomNavigationBar: AppBottomNavigationBar(index: 0),
        );
      }
    );
  }
}