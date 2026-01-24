import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

import 'nav_rail_theme.dart';

class NavRailPlaceholderItem<T> extends StatefulWidget {
  final NavRailItemTheme? theme;

  const NavRailPlaceholderItem({
    super.key,
    this.theme,
  });

  @override
  State<NavRailPlaceholderItem<T>> createState() => _NavRailPlaceholderItemState<T>();
}

class _NavRailPlaceholderItemState<T> extends State<NavRailPlaceholderItem<T>> {
  late final double _titleWidthFactor;
  late final double _subtitleWidthFactor;

  @override
  void initState() {
    super.initState();

    final r = Random();
    _titleWidthFactor = 0.6 + r.nextDouble() * 0.2;
    _subtitleWidthFactor = 0.3 + r.nextDouble() * 0.2;
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<NavRailItemTheme>()
      ?? NavRailItemTheme();

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final titleTextStyle = theme.titleTextStyle ?? themeData.textTheme.bodyLarge ?? TextStyle();
    final subtitleTextStyle = theme.subtitleTextStyle ?? themeData.textTheme.labelSmall ?? TextStyle();

    final titleHeight = MediaQuery.of(context).textScaler.scale(titleTextStyle.fontSize ?? 24)
      * (titleTextStyle.height ?? (themeData.useMaterial3 ? 1.5 : 1.2)) - 2;
    final subtitleHeight = MediaQuery.of(context).textScaler.scale(subtitleTextStyle.fontSize ?? 18)
      * (subtitleTextStyle.height ?? (themeData.useMaterial3 ? 1.5 : 1.2)) - 2;

    return Padding(
      padding: theme.padding,
      child: Row(
        spacing: theme.iconLeftSpacing,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          HoverIcon(
            theme: theme.iconTheme,
            icon: Icons.circle,
            applyTextScaling: true,
          ),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Shimmer(
                  child: FractionallySizedBox(
                    widthFactor: _titleWidthFactor,
                    child: Container(
                      height: titleHeight,
                      decoration: BoxDecoration(
                        color: theme.placeholderBackgroundColor ?? colorScheme.surfaceContainer.withValues(alpha: 0.4),
                        borderRadius: theme.placeholderBorderRadius,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: theme.textInnerSpacing + 4),
          
                Shimmer(
                  child: FractionallySizedBox(
                    widthFactor: _subtitleWidthFactor,
                    child: Container(
                      height: subtitleHeight,
                      decoration: BoxDecoration(
                        color: theme.placeholderBackgroundColor ?? colorScheme.surfaceContainer.withValues(alpha: 0.3),
                        borderRadius: theme.placeholderBorderRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}