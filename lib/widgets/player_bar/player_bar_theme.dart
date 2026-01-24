import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon_theme.dart';
import 'package:qjay/widgets/button/rounded_button_theme.dart';
import 'package:qjay/widgets/control_slider/control_slider_theme.dart';
import 'package:qjay/widgets/track_info/track_info_theme.dart';

class PlayerBarTheme extends ThemeExtension<PlayerBarTheme> {
  // Layout
  final double height;
  final double iconHeight;
  final double presetInfoHeight;
  final double artistTitleHeight;
  final TrackInfoTheme? trackInfoTheme;

  final double centerWidthMax;
  final double volumeWidth;

  // Spacing
  final EdgeInsets contentPadding;
  final double centerTopPadding;
  final EdgeInsets controlClusterPadding;
  final double progressHeight;

  // Motion
  final Duration animationDuration;
  final Curve animationCurve;

  // Colors
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? presetSelectedColor;
  final Color? presetSelectedHoverBlend;
  final Color? progressIndicatorBackgroundColor;
  final Color? progressIndicatorForegroundColor;

  // Icon themes
  final HoverIconTheme? presetIconTheme;
  final HoverIconTheme? volumeIconTheme;

  // Buttons (RoundedButtonTheme)
  final RoundedButtonTheme? primaryButtonTheme;   // play/pause
  final RoundedButtonTheme? smallButtonTheme;     // stop/next/downvote

  // Slider
  final ControlSliderTheme? sliderTheme;

  const PlayerBarTheme({
    // Layout
    this.height = 82,
    this.iconHeight = 56,
    this.presetInfoHeight = 24,
    this.artistTitleHeight = 40,
    this.trackInfoTheme,

    this.centerWidthMax = 420,
    this.volumeWidth = 260,

    // Spacing
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.centerTopPadding = 6.0,
    this.controlClusterPadding = const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    this.progressHeight = 6,

    // Motion
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeOut,

    // Colors
    this.backgroundColor,
    this.borderColor,
    this.presetSelectedColor,
    this.presetSelectedHoverBlend,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorForegroundColor,

    // Icons
    this.presetIconTheme,
    this.volumeIconTheme,

    // Buttons
    this.primaryButtonTheme,
    this.smallButtonTheme,

    // Slider
    this.sliderTheme,
  });

  factory PlayerBarTheme.fromBrightness(Brightness b) =>
      b == Brightness.dark ? PlayerBarTheme.dark : PlayerBarTheme.light;

  static final PlayerBarTheme light = PlayerBarTheme();
  static final PlayerBarTheme dark = PlayerBarTheme();

  @override
  PlayerBarTheme copyWith({
    double? height,
    double? iconHeight,
    double? presetInfoHeight,
    double? artistTitleHeight,
    TrackInfoTheme? trackInfoTheme,
    double? centerWidthMax,
    double? volumeWidth,
    EdgeInsets? contentPadding,
    double? centerTopPadding,
    EdgeInsets? controlClusterPadding,
    double? progressHeight,
    Duration? animationDuration,
    Curve? animationCurve,
    Color? backgroundColor,
    Color? borderColor,
    Color? presetSelectedColor,
    Color? presetSelectedHoverBlend,
    Color? progressIndicatorBackgroundColor,
    Color? progressIndicatorForegroundColor,
    HoverIconTheme? presetIconTheme,
    HoverIconTheme? volumeIconTheme,
    RoundedButtonTheme? primaryButtonTheme,
    RoundedButtonTheme? smallButtonTheme,
    ControlSliderTheme? sliderTheme,
  }) {
    return PlayerBarTheme(
      height: height ?? this.height,
      iconHeight: iconHeight ?? this.iconHeight,
      presetInfoHeight: presetInfoHeight ?? this.presetInfoHeight,
      artistTitleHeight: artistTitleHeight ?? this.artistTitleHeight,
      trackInfoTheme: trackInfoTheme ?? this.trackInfoTheme,
      centerWidthMax: centerWidthMax ?? this.centerWidthMax,
      volumeWidth: volumeWidth ?? this.volumeWidth,
      contentPadding: contentPadding ?? this.contentPadding,
      centerTopPadding: centerTopPadding ?? this.centerTopPadding,
      controlClusterPadding: controlClusterPadding ?? this.controlClusterPadding,
      progressHeight: progressHeight ?? this.progressHeight,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      presetSelectedColor: presetSelectedColor ?? this.presetSelectedColor,
      presetSelectedHoverBlend: presetSelectedHoverBlend ?? this.presetSelectedHoverBlend,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor ?? this.progressIndicatorBackgroundColor,
      progressIndicatorForegroundColor: progressIndicatorForegroundColor ?? this.progressIndicatorForegroundColor,
      presetIconTheme: presetIconTheme ?? this.presetIconTheme,
      volumeIconTheme: volumeIconTheme ?? this.volumeIconTheme,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      smallButtonTheme: smallButtonTheme ?? this.smallButtonTheme,
      sliderTheme: sliderTheme ?? this.sliderTheme,
    );
  }

  @override
  PlayerBarTheme lerp(ThemeExtension<PlayerBarTheme>? other, double t) {
    if (other is! PlayerBarTheme) return this;
    return PlayerBarTheme(
      height: lerpDouble(height, other.height, t) ?? height,
      iconHeight: lerpDouble(iconHeight, other.iconHeight, t) ?? iconHeight,
      presetInfoHeight: lerpDouble(presetInfoHeight, other.presetInfoHeight, t) ?? presetInfoHeight,
      artistTitleHeight: lerpDouble(artistTitleHeight, other.artistTitleHeight, t) ?? artistTitleHeight,
      trackInfoTheme: t < 0.5 ? trackInfoTheme : other.trackInfoTheme,
      centerWidthMax: lerpDouble(centerWidthMax, other.centerWidthMax, t) ?? centerWidthMax,
      volumeWidth: lerpDouble(volumeWidth, other.volumeWidth, t) ?? volumeWidth,
      contentPadding: EdgeInsets.lerp(contentPadding, other.contentPadding, t) ?? contentPadding,
      centerTopPadding: centerTopPadding + (other.centerTopPadding - centerTopPadding) * t,
      controlClusterPadding: EdgeInsets.lerp(controlClusterPadding, other.controlClusterPadding, t) ?? controlClusterPadding,
      progressHeight: progressHeight + (other.progressHeight - progressHeight) * t,
      animationDuration: Duration(
        milliseconds: (animationDuration.inMilliseconds * (1 - t) + other.animationDuration.inMilliseconds * t).round(),
      ),
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      presetSelectedColor: Color.lerp(presetSelectedColor, other.presetSelectedColor, t),
      presetSelectedHoverBlend: Color.lerp(presetSelectedHoverBlend, other.presetSelectedHoverBlend, t),
      progressIndicatorBackgroundColor: Color.lerp(progressIndicatorBackgroundColor, other.progressIndicatorBackgroundColor, t),
      progressIndicatorForegroundColor: Color.lerp(progressIndicatorForegroundColor, other.progressIndicatorForegroundColor, t),
      presetIconTheme: t < 0.5 ? presetIconTheme : other.presetIconTheme,
      volumeIconTheme: t < 0.5 ? volumeIconTheme : other.volumeIconTheme,
      primaryButtonTheme: t < 0.5 ? primaryButtonTheme : other.primaryButtonTheme,
      smallButtonTheme: t < 0.5 ? smallButtonTheme : other.smallButtonTheme,
      sliderTheme: t < 0.5 ? sliderTheme : other.sliderTheme,
    );
  }
}
