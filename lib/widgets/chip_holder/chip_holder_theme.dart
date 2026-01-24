import 'dart:ui';

import 'package:flutter/material.dart';

class ChipHolderTheme extends ThemeExtension<ChipHolderTheme> {
  final EdgeInsetsGeometry gutterPadding;
  final EdgeInsetsGeometry chipPadding;

  final Color? activeBackgroundColor;
  final Color? activeBorderColor;
  final TextStyle? activeTextStyle;

  final Color? inactiveBackgroundColor;
  final Color? inactiveBorderColor;
  final TextStyle? inactiveTextStyle;

  final double minWidth;
  final double spacing;
  final double runSpacing;

  final double borderWidth;
  final BorderRadius borderRadius;

  const ChipHolderTheme({
    this.gutterPadding = const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    this.chipPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

    this.activeBackgroundColor,
    this.activeBorderColor,
    this.activeTextStyle,

    this.inactiveBackgroundColor,
    this.inactiveBorderColor,
    this.inactiveTextStyle,

    this.minWidth = 32,
    this.spacing = 8,
    this.runSpacing = 8,

    this.borderWidth = 1,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  ChipHolderTheme copyWith({
    EdgeInsetsGeometry? gutterPadding,
    EdgeInsetsGeometry? chipPadding,
    
    Color? activeBackgroundColor,
    Color? activeBorderColor,
    TextStyle? activeTextStyle,

    Color? inactiveBackgroundColor,
    Color? inactiveBorderColor,
    TextStyle? inactiveTextStyle,

    double? minWidth,
    double? spacing,
    double? runSpacing,

    double? borderWidth,
    BorderRadius? borderRadius,
  })
    => ChipHolderTheme(
      gutterPadding: gutterPadding ?? this.gutterPadding,
      chipPadding: chipPadding ?? this.chipPadding,

      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,

      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      inactiveBorderColor: inactiveBorderColor ?? this.inactiveBorderColor,
      inactiveTextStyle: inactiveTextStyle ?? this.inactiveTextStyle,

      minWidth: minWidth ?? this.minWidth,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,

      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
    );

  @override
  ChipHolderTheme lerp(ChipHolderTheme? other, double t) {
    if (other is! ChipHolderTheme) return this;
    throw ChipHolderTheme(
      gutterPadding: EdgeInsetsGeometry.lerp(gutterPadding, other.gutterPadding, t)!,
      chipPadding: EdgeInsetsGeometry.lerp(chipPadding, other.chipPadding, t)!,

      activeBackgroundColor: Color.lerp(activeBackgroundColor, other.activeBackgroundColor, t),
      activeBorderColor: Color.lerp(activeBackgroundColor, other.activeBackgroundColor, t),
      activeTextStyle: TextStyle.lerp(activeTextStyle, other.activeTextStyle, t),

      inactiveBackgroundColor: Color.lerp(inactiveBackgroundColor, other.inactiveBackgroundColor, t),
      inactiveBorderColor: Color.lerp(inactiveBackgroundColor, other.inactiveBackgroundColor, t),
      inactiveTextStyle: TextStyle.lerp(inactiveTextStyle, other.inactiveTextStyle, t),

      minWidth: lerpDouble(minWidth, other.minWidth, t)!,
      spacing: lerpDouble(spacing, other.spacing, t)!,
      runSpacing: lerpDouble(runSpacing, other.spacing, t)!,

      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
  
}

class ChipHolderThemeLegacy extends ThemeExtension<ChipHolderThemeLegacy> {
  // Layout
  final double minWidth;
  final double spacing;
  final double runSpacing;
  final EdgeInsets itemPadding;
  final BorderRadius borderRadius;
  final double elevation;

  // Colors / Borders
  final Color inactiveBackground;
  final Color activeBackground;
  final Border? inactiveBorder;
  final Border? activeBorder;

  // Typography
  final TextStyle inactiveTextStyle;
  final TextStyle activeTextStyle;

  const ChipHolderThemeLegacy({
    required this.minWidth,
    required this.spacing,
    required this.runSpacing,
    required this.itemPadding,
    required this.borderRadius,
    required this.elevation,
    required this.inactiveBackground,
    required this.activeBackground,
    this.inactiveBorder,
    this.activeBorder,
    required this.inactiveTextStyle,
    required this.activeTextStyle,
  });

  factory ChipHolderThemeLegacy.fromBrightness(Brightness b) =>
    b == Brightness.dark ? ChipHolderThemeLegacy.dark : ChipHolderThemeLegacy.light;

  static const ChipHolderThemeLegacy light = ChipHolderThemeLegacy(
    minWidth: 32,
    spacing: 8,
    runSpacing: 8,
    itemPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    borderRadius: BorderRadius.all(Radius.circular(14)),
    elevation: 0,
    inactiveBackground: Color(0xF0ECEFF3),
    activeBackground: Color(0x1A1A73E8),
    inactiveBorder: null,
    activeBorder: Border.fromBorderSide(BorderSide(color: Color(0xFF1A73E8), width: 1)),
    inactiveTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF2B2F36)),
    activeTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1A73E8)),
  );

  static const ChipHolderThemeLegacy dark = ChipHolderThemeLegacy(
    minWidth: 32,
    spacing: 8.0,
    runSpacing: 8.0,
    itemPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    borderRadius: BorderRadius.all(Radius.circular(14)),
    elevation: 0.0,
    inactiveBackground: Color(0x1FFFFFFF),
    activeBackground: Color(0x332196F3),
    inactiveBorder: null,
    activeBorder: Border.fromBorderSide(BorderSide(color: Color(0xFF8AB4F8), width: 1)),
    inactiveTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFFE6E8EB)),
    activeTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF8AB4F8)),
  );

  @override
  ChipHolderThemeLegacy copyWith({
    double? minWidth,
    double? spacing,
    double? runSpacing,
    EdgeInsets? itemPadding,
    BorderRadius? borderRadius,
    double? elevation,
    Color? inactiveBackground,
    Color? activeBackground,
    Border? inactiveBorder,
    Border? activeBorder,
    TextStyle? inactiveTextStyle,
    TextStyle? activeTextStyle,
  }) {
    return ChipHolderThemeLegacy(
      minWidth: minWidth ?? this.minWidth,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      itemPadding: itemPadding ?? this.itemPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      inactiveBackground: inactiveBackground ?? this.inactiveBackground,
      activeBackground: activeBackground ?? this.activeBackground,
      inactiveBorder: inactiveBorder ?? this.inactiveBorder,
      activeBorder: activeBorder ?? this.activeBorder,
      inactiveTextStyle: inactiveTextStyle ?? this.inactiveTextStyle,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,
    );
  }

  @override
  ChipHolderThemeLegacy lerp(ThemeExtension<ChipHolderThemeLegacy>? other, double t) {
    if (other is! ChipHolderThemeLegacy) return this;
    return ChipHolderThemeLegacy(
      minWidth: _lerpDouble(minWidth, other.minWidth, t),
      spacing: _lerpDouble(spacing, other.spacing, t),
      runSpacing: _lerpDouble(runSpacing, other.runSpacing, t),
      itemPadding: EdgeInsets.lerp(itemPadding, other.itemPadding, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      elevation: _lerpDouble(elevation, other.elevation, t),
      inactiveBackground: Color.lerp(inactiveBackground, other.inactiveBackground, t)!,
      activeBackground: Color.lerp(activeBackground, other.activeBackground, t)!,
      inactiveBorder: Border.lerp(inactiveBorder, other.inactiveBorder, t),
      activeBorder: Border.lerp(activeBorder, other.activeBorder, t),
      inactiveTextStyle: TextStyle.lerp(inactiveTextStyle, other.inactiveTextStyle, t)!,
      activeTextStyle: TextStyle.lerp(activeTextStyle, other.activeTextStyle, t)!,
    );
  }

  static double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
}
