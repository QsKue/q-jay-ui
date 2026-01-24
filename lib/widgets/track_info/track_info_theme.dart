import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';

class TrackInfoTheme extends ThemeExtension<TrackInfoTheme> {
  // Icon tile (left)
  final double iconSize;                // square size; typically matches PlayerBarTheme.iconHeight
  final double iconCornerRadius;
  final double iconHoverScale;          // e.g. 1.03
  final EdgeInsets iconMargin;          // space to the right

  // Colors
  final Color? iconBackgroundColor;     // base background (e.g. cs.primaryContainer)
  final Color? iconHoverBlendColor;     // blended into background on hover
  final Color? iconForegroundColor;     // icon color (e.g. cs.onPrimaryContainer)

  // Text
  final TextStyle? presetLineStyle;     // category - name
  final TextStyle? artistStyle;
  final TextStyle? titleStyle;

  // Motion
  final Duration animationDuration;
  final Curve animationCurve;

  // Icon button theme (for HoverIconButton)
  final HoverIconTheme? iconButtonTheme;

  const TrackInfoTheme({
    this.iconSize = 56.0,
    this.iconCornerRadius = 8.0,
    this.iconHoverScale = 1.03,
    this.iconMargin = const EdgeInsets.only(right: 12),

    this.iconBackgroundColor,
    this.iconHoverBlendColor,
    this.iconForegroundColor,

    this.presetLineStyle,
    this.artistStyle,
    this.titleStyle,

    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeOut,

    this.iconButtonTheme,
  });

  @override
  TrackInfoTheme copyWith({
    double? iconSize,
    double? iconCornerRadius,
    double? iconHoverScale,
    EdgeInsets? iconMargin,
    Color? iconBackgroundColor,
    Color? iconHoverBlendColor,
    Color? iconForegroundColor,
    TextStyle? presetLineStyle,
    TextStyle? artistStyle,
    TextStyle? titleStyle,
    Duration? animationDuration,
    Curve? animationCurve,
    HoverIconTheme? iconButtonTheme,
  }) {
    return TrackInfoTheme(
      iconSize: iconSize ?? this.iconSize,
      iconCornerRadius: iconCornerRadius ?? this.iconCornerRadius,
      iconHoverScale: iconHoverScale ?? this.iconHoverScale,
      iconMargin: iconMargin ?? this.iconMargin,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconHoverBlendColor: iconHoverBlendColor ?? this.iconHoverBlendColor,
      iconForegroundColor: iconForegroundColor ?? this.iconForegroundColor,
      presetLineStyle: presetLineStyle ?? this.presetLineStyle,
      artistStyle: artistStyle ?? this.artistStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      iconButtonTheme: iconButtonTheme ?? this.iconButtonTheme,
    );
  }

  @override
  TrackInfoTheme lerp(ThemeExtension<TrackInfoTheme>? other, double t) {
    if (other is! TrackInfoTheme) return this;
    return TrackInfoTheme(
      iconSize: lerpDouble(iconSize, other.iconSize, t) ?? iconSize,
      iconCornerRadius: lerpDouble(iconCornerRadius, other.iconCornerRadius, t) ?? iconCornerRadius,
      iconHoverScale: lerpDouble(iconHoverScale, other.iconHoverScale, t) ?? iconHoverScale,
      iconMargin: EdgeInsets.lerp(iconMargin, other.iconMargin, t) ?? iconMargin,
      iconBackgroundColor: Color.lerp(iconBackgroundColor, other.iconBackgroundColor, t),
      iconHoverBlendColor: Color.lerp(iconHoverBlendColor, other.iconHoverBlendColor, t),
      iconForegroundColor: Color.lerp(iconForegroundColor, other.iconForegroundColor, t),
      presetLineStyle: TextStyle.lerp(presetLineStyle, other.presetLineStyle, t),
      artistStyle: TextStyle.lerp(artistStyle, other.artistStyle, t),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      animationDuration: Duration(
        milliseconds: (animationDuration.inMilliseconds * (1 - t) + other.animationDuration.inMilliseconds * t).round(),
      ),
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      iconButtonTheme: t < 0.5 ? iconButtonTheme : other.iconButtonTheme,
    );
  }
}
