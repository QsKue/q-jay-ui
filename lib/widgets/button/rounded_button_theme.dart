import 'package:flutter/material.dart';

class RoundedButtonTheme extends ThemeExtension<RoundedButtonTheme> {
  final Color backgroundColor;
  final Color hoverBackgroundColor;
  final Color foregroundColor;
  final Color hoverForegroundColor;

  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;

  /// Diameter of the circular button (fixedSize/minimumSize).
  final double size;

  /// Icon size inside the button.
  final double iconSize;

  final EdgeInsets padding;

  const RoundedButtonTheme({
    required this.backgroundColor,
    required this.hoverBackgroundColor,
    required this.foregroundColor,
    required this.hoverForegroundColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    this.size = 40.0,
    this.iconSize = 20.0,
    this.padding = EdgeInsets.zero,
  });

  factory RoundedButtonTheme.fromBrightness(Brightness b) =>
      b == Brightness.dark ? RoundedButtonTheme.dark : RoundedButtonTheme.light;

  static const RoundedButtonTheme light = RoundedButtonTheme(
    backgroundColor: Color(0xFFE8EAED),        // secondaryContainer-ish
    hoverBackgroundColor: Color(0xFF1A73E8),   // primary hover
    foregroundColor: Color(0xFF202124),        // onSecondaryContainer-ish
    hoverForegroundColor: Colors.white,        // onPrimary hover
    disabledBackgroundColor: Color(0xFFEDEFF2),
    disabledForegroundColor: Color(0xFF9AA0A6),
    size: 42.0,
    iconSize: 22.0,
    padding: EdgeInsets.zero,
  );

  static const RoundedButtonTheme dark = RoundedButtonTheme(
    backgroundColor: Color(0xFF2B2F36),
    hoverBackgroundColor: Color(0xFF8AB4F8),
    foregroundColor: Color(0xFFE6E8EB),
    hoverForegroundColor: Color(0xFF0B1324),
    disabledBackgroundColor: Color(0xFF30343A),
    disabledForegroundColor: Color(0xFF8F949A),
    size: 42.0,
    iconSize: 22.0,
    padding: EdgeInsets.zero,
  );

  @override
  RoundedButtonTheme copyWith({
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    double? size,
    double? iconSize,
    EdgeInsets? padding,
  }) {
    return RoundedButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      size: size ?? this.size,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
    );
  }

  @override
  RoundedButtonTheme lerp(
      ThemeExtension<RoundedButtonTheme>? other, double t) {
    if (other is! RoundedButtonTheme) return this;
    return RoundedButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      hoverBackgroundColor:
          Color.lerp(hoverBackgroundColor, other.hoverBackgroundColor, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      hoverForegroundColor:
          Color.lerp(hoverForegroundColor, other.hoverForegroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledForegroundColor: Color.lerp(
          disabledForegroundColor, other.disabledForegroundColor, t)!,
      size: size + (other.size - size) * t,
      iconSize: iconSize + (other.iconSize - iconSize) * t,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}
