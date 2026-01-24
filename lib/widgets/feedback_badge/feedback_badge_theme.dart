import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class FeedbackBadgeThemeData {
  const FeedbackBadgeThemeData({
    this.badgeHorizontalPadding = 8.0,
    this.badgeVerticalPadding = 6.0,
    required this.badgeBackgroundColor,
    this.badgeCornerRadius = 6.0,
    this.badgeMaxWidth = 240.0,
    this.badgeTextStyle,
  });

  final double badgeHorizontalPadding;
  final double badgeVerticalPadding;
  final Color badgeBackgroundColor;
  final double badgeCornerRadius;
  final double badgeMaxWidth;
  final TextStyle? badgeTextStyle;

  FeedbackBadgeThemeData copyWith({
    double? badgeHorizontalPadding,
    double? badgeVerticalPadding,
    Color? badgeBackgroundColor,
    double? badgeCornerRadius,
    double? badgeMaxWidth,
    TextStyle? badgeTextStyle,
  }) {
    return FeedbackBadgeThemeData(
      badgeHorizontalPadding: badgeHorizontalPadding ?? this.badgeHorizontalPadding,
      badgeVerticalPadding: badgeVerticalPadding ?? this.badgeVerticalPadding,
      badgeBackgroundColor: badgeBackgroundColor ?? this.badgeBackgroundColor,
      badgeCornerRadius: badgeCornerRadius ?? this.badgeCornerRadius,
      badgeMaxWidth: badgeMaxWidth ?? this.badgeMaxWidth,
      badgeTextStyle: badgeTextStyle ?? this.badgeTextStyle,
    );
  }

  FeedbackBadgeThemeData lerp(
    FeedbackBadgeThemeData b,
    double t,
  ) {
    return FeedbackBadgeThemeData(
      badgeHorizontalPadding: lerpDouble(badgeHorizontalPadding, b.badgeHorizontalPadding, t)!,
      badgeVerticalPadding: lerpDouble(badgeVerticalPadding, b.badgeVerticalPadding, t)!,
      badgeBackgroundColor: Color.lerp(badgeBackgroundColor, b.badgeBackgroundColor, t)!,
      badgeCornerRadius: lerpDouble(badgeCornerRadius, b.badgeCornerRadius, t)!,
      badgeMaxWidth: lerpDouble(badgeMaxWidth, b.badgeMaxWidth, t)!,
      badgeTextStyle: TextStyle.lerp(badgeTextStyle, b.badgeTextStyle, t),
    );
  }

  static FeedbackBadgeThemeData base(BuildContext context) {
    final theme = Theme.of(context);
    return FeedbackBadgeThemeData(
      badgeBackgroundColor: theme.colorScheme.primary,
      badgeTextStyle: theme.textTheme.bodyMedium,
    );
  }
}

class FeedbackBadgeTheme extends InheritedTheme {
  const FeedbackBadgeTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final FeedbackBadgeThemeData data;

  static FeedbackBadgeThemeData? of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<FeedbackBadgeTheme>();
    return inherited?.data;
  }

  @override
  bool updateShouldNotify(FeedbackBadgeTheme oldWidget) => oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return FeedbackBadgeTheme(data: data, child: child);
  }
}