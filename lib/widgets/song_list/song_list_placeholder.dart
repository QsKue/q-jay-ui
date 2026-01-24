import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:qjay/widgets/button/hover_icon.dart';

import 'song_list.dart';

class SongListRowPlaceholder<T> extends StatefulWidget {
  final SongListRowTheme? theme;

  const SongListRowPlaceholder({
    super.key,
    this.theme,
  });

  @override
  State<SongListRowPlaceholder<T>> createState() => _SongListPlaceholderItemState<T>();
}

class _SongListPlaceholderItemState<T> extends State<SongListRowPlaceholder<T>> {
  late final double _titleWidthFactor;
  late final double _subtitleWidthFactor;

  @override
  void initState() {
    super.initState();

    final r = Random();
    _titleWidthFactor = 0.5 + r.nextDouble() * 0.2;
    _subtitleWidthFactor = 0.3 + r.nextDouble() * 0.2;
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<SongListRowTheme>()
      ?? SongListRowTheme();

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final titleTextStyle = theme.titleTextStyle ?? themeData.textTheme.bodyLarge ?? TextStyle();
    final subtitleTextStyle = theme.subtitleTextStyle ?? themeData.textTheme.labelSmall ?? TextStyle();

    final titleHeight = MediaQuery.of(context).textScaler.scale(titleTextStyle.fontSize ?? 24)
      * (titleTextStyle.height ?? (themeData.useMaterial3 ? 1.5 : 1.2)) - 8;
    final subtitleHeight = MediaQuery.of(context).textScaler.scale(subtitleTextStyle.fontSize ?? 18)
      * (subtitleTextStyle.height ?? (themeData.useMaterial3 ? 1.5 : 1.2)) - 8;

    return Padding(
      padding: theme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Center(
            child: HoverIcon(
              theme: theme.iconTheme.copyWith(
                size: 24
              ),
              icon: Icons.play_arrow,
            ),
          ),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.placeholderSpacing),
                  child: Shimmer(
                    color: colorScheme.surfaceBright,
                    child: FractionallySizedBox(
                      widthFactor: _titleWidthFactor,
                      child: Container(
                        height: titleHeight,
                        decoration: BoxDecoration(
                          color: theme.placeholderBackgroundColor ?? colorScheme.surfaceContainer.withValues(alpha: 0.6),
                          borderRadius: theme.placeholderBorderRadius,
                        ),
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: EdgeInsets.symmetric(vertical: theme.placeholderSpacing),
                  child: Shimmer(
                    color: colorScheme.surfaceBright,
                    child: FractionallySizedBox(
                      widthFactor: _subtitleWidthFactor,
                      child: Container(
                        height: subtitleHeight,
                        decoration: BoxDecoration(
                          color: theme.placeholderBackgroundColor ?? colorScheme.surfaceContainer.withValues(alpha: 0.4),
                          borderRadius: theme.placeholderBorderRadius,
                        ),
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