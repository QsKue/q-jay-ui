import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';

class TitleBarTheme extends ThemeExtension<TitleBarTheme> {
  final double height;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? dividerColor;
  final double searchHeight;
  final double searchWidth;
  final BorderRadius searchRadius;
  final Color? searchFillColor;
  final Color? searchBorderColor;
  final Color? searchBorderHoverColor;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final HoverIconTheme? leftIconTheme;
  final HoverIconTheme? windowIconTheme;
  final double windowIconWidth;

  const TitleBarTheme({
    this.height = 48,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.backgroundColor,
    this.dividerColor,
    this.searchHeight = 36,
    this.searchWidth = 360,
    this.searchRadius = const BorderRadius.all(Radius.circular(8)),
    this.searchFillColor,
    this.searchBorderColor,
    this.searchBorderHoverColor,
    this.searchTextStyle,
    this.searchHintStyle,
    this.leftIconTheme,
    this.windowIconTheme,
    this.windowIconWidth = 40,
  });

  @override
  TitleBarTheme copyWith({
    double? height,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? dividerColor,
    double? searchHeight,
    double? searchWidth,
    BorderRadius? searchRadius,
    Color? searchFillColor,
    Color? searchBorderColor,
    Color? searchBorderHoverColor,
    TextStyle? searchTextStyle,
    TextStyle? searchHintStyle,
    HoverIconTheme? leftIconTheme,
    HoverIconTheme? windowIconTheme,
    double? windowIconWidth,
  }) {
    return TitleBarTheme(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      searchHeight: searchHeight ?? this.searchHeight,
      searchWidth: searchWidth ?? this.searchWidth,
      searchRadius: searchRadius ?? this.searchRadius,
      searchFillColor: searchFillColor ?? this.searchFillColor,
      searchBorderColor: searchBorderColor ?? this.searchBorderColor,
      searchBorderHoverColor: searchBorderHoverColor ?? this.searchBorderHoverColor,
      searchTextStyle: searchTextStyle ?? this.searchTextStyle,
      searchHintStyle: searchHintStyle ?? this.searchHintStyle,
      leftIconTheme: leftIconTheme ?? this.leftIconTheme,
      windowIconTheme: windowIconTheme ?? this.windowIconTheme,
      windowIconWidth: windowIconWidth ?? this.windowIconWidth,
    );
  }

  factory TitleBarTheme.fromBrightness(Brightness b) =>
      b == Brightness.dark ? TitleBarTheme.dark : TitleBarTheme.light;

  static final TitleBarTheme light = TitleBarTheme(
    backgroundColor: const Color(0xFFF6F7F9),
    dividerColor: const Color(0xFFE5E7EB),
    searchFillColor: Colors.white,
    searchBorderColor: const Color(0xFFB0B6BE),
    searchBorderHoverColor: const Color(0xFF1A73E8),
    searchHintStyle: const TextStyle(color: Color(0xFF6B7280)),
    searchTextStyle: const TextStyle(color: Color(0xFF111827)),
  );

  static final TitleBarTheme dark = TitleBarTheme(
    backgroundColor: const Color(0xFF111316),
    dividerColor: const Color(0xFF2A2F36),
    searchFillColor: const Color(0xFF1C1F24),
    searchBorderColor: const Color(0xFF6B6F76),
    searchBorderHoverColor: const Color(0xFF8AB4F8),
    searchHintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
    searchTextStyle: const TextStyle(color: Color(0xFFF9FAFB)),
  );

  @override
  TitleBarTheme lerp(ThemeExtension<TitleBarTheme>? other, double t) {
    if (other is! TitleBarTheme) return this;
    return TitleBarTheme(
      height: lerpDouble(height, other.height, t) ?? height,
      padding: EdgeInsets.lerp(padding, other.padding, t) ?? padding,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
      searchHeight: lerpDouble(searchHeight, other.searchHeight, t) ?? searchHeight,
      searchWidth: lerpDouble(searchWidth, other.searchWidth, t) ?? searchWidth,
      searchRadius: BorderRadius.lerp(searchRadius, other.searchRadius, t) ?? searchRadius,
      searchFillColor: Color.lerp(searchFillColor, other.searchFillColor, t),
      searchBorderColor: Color.lerp(searchBorderColor, other.searchBorderColor, t),
      searchBorderHoverColor: Color.lerp(searchBorderHoverColor, other.searchBorderHoverColor, t),
      searchTextStyle: TextStyle.lerp(searchTextStyle, other.searchTextStyle, t),
      searchHintStyle: TextStyle.lerp(searchHintStyle, other.searchHintStyle, t),
      leftIconTheme: t < 0.5 ? leftIconTheme : other.leftIconTheme,
      windowIconTheme: t < 0.5 ? windowIconTheme : other.windowIconTheme,
      windowIconWidth: lerpDouble(windowIconWidth, other.windowIconWidth, t) ?? windowIconWidth,
    );
  }
}
