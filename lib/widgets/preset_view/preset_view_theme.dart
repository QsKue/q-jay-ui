import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'package:qjay/widgets/feedback_badge/feedback_badge_theme.dart';

// Main Theme
class PresetViewTheme extends ThemeExtension<PresetViewTheme> {
  final Color? backgroundColor;

  final EdgeInsetsGeometry gutterPadding;
  final double rowSpacing;

  final PresetViewDraggableItemTheme? dragTheme;
  final FeedbackBadgeThemeData? badgeTheme;

  const PresetViewTheme({
    this.backgroundColor,
    this.rowSpacing = 4,
    this.gutterPadding = const EdgeInsets.all(4),
    this.dragTheme,
    this.badgeTheme,
  });

  @override
  PresetViewTheme copyWith({
    Color? backgroundColor,

    EdgeInsetsGeometry? gutterPadding,
    double? rowSpacing,

    PresetViewDraggableItemTheme? dragTheme,
    FeedbackBadgeThemeData? badgeTheme,
  }) {
    return PresetViewTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,

      rowSpacing: rowSpacing ?? this.rowSpacing,
      gutterPadding: gutterPadding ?? this.gutterPadding,

      dragTheme: dragTheme ?? this.dragTheme,
      badgeTheme: badgeTheme ?? this.badgeTheme,
    );
  }

  @override
  PresetViewTheme lerp(PresetViewTheme? other, double t) {
    if (other is! PresetViewTheme) return this;
    return PresetViewTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,

      gutterPadding: EdgeInsetsGeometry.lerp(gutterPadding, other.gutterPadding, t)!,
      rowSpacing: lerpDouble(rowSpacing, other.rowSpacing, t)!,

      dragTheme: dragTheme?.lerp(other.dragTheme!, t),
      badgeTheme: badgeTheme?.lerp(other.badgeTheme!, t),
    );
  }
}

// TODO: fix this pleasae
class PresetViewDraggableItemTheme {
  const PresetViewDraggableItemTheme({
    this.indicatorThickness = 2.0,
    required this.indicatorColor,
  });

  final double indicatorThickness;
  final Color indicatorColor;

  PresetViewDraggableItemTheme copyWith({
    double? indicatorThickness,
    Color? indicatorColor,
  }) {
    return PresetViewDraggableItemTheme(
      indicatorThickness: indicatorThickness ?? this.indicatorThickness,
      indicatorColor: indicatorColor ?? this.indicatorColor,
    );
  }

  PresetViewDraggableItemTheme lerp(
    PresetViewDraggableItemTheme b,
    double t,
  ) {
    return PresetViewDraggableItemTheme(
      indicatorThickness: lerpDouble(indicatorThickness, b.indicatorThickness, t)!,
      indicatorColor: Color.lerp(indicatorColor, b.indicatorColor, t)!,
    );
  }

  factory PresetViewDraggableItemTheme.base(BuildContext context) {
    final theme = Theme.of(context);
    return PresetViewDraggableItemTheme(
      indicatorThickness: 2.0,
      indicatorColor: theme.colorScheme.primary,
    );
  }
}