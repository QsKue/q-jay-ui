import 'package:flutter/material.dart';

import 'package:qjay/widgets/preset_banner/preset_banner_bar.dart';
import 'package:qjay/widgets/preset_banner/preset_banner_theme.dart';

class PresetBannerEnergyBar extends StatelessWidget {
  final PresetBannerSelectionTheme? theme;

  final int currentGrouping;
  final List<int> currentEnergies;

  final List<String> groupingItems;
  final int groupingSelectedIndex;
  final void Function(int index) onGroupingTapIndex;

  final List<String> energyItems;
  final int energySelectedIndex;
  final void Function(int index) onEnergyTapIndex;
  
  final bool hideEnergies;

  const PresetBannerEnergyBar({
    super.key,
    this.theme,
    required this.currentGrouping,
    required this.currentEnergies,
    required this.groupingItems,
    required this.energyItems,
    required this.groupingSelectedIndex,
    required this.energySelectedIndex,
    required this.onGroupingTapIndex,
    required this.onEnergyTapIndex,
    required this.hideEnergies,
  });

  @override
  Widget build(BuildContext context) {
    final barsTheme = theme
      ?? Theme.of(context).extension<PresetBannerSelectionTheme>()
      ?? PresetBannerSelectionTheme();

    return Column(
      spacing: barsTheme.barSpacing,
      mainAxisSize: MainAxisSize.min,
      children: [

        PresetBannerBar(
          leadingIcon: Icons.layers,
          items: groupingItems,
          currentValue: currentGrouping.toString(),
          selectedIndex: groupingSelectedIndex,
          onTapIndex: onGroupingTapIndex,
        ),

        if (!hideEnergies)
          PresetBannerBar(
            leadingIcon: Icons.bar_chart_outlined,
            items: energyItems,
            currentValue: currentEnergies.join("-"),
            selectedIndex: energySelectedIndex,
            onTapIndex: onEnergyTapIndex,
            hasTopBorder: barsTheme.barSpacing != 0,
          ),
      ],
    );
  }
}