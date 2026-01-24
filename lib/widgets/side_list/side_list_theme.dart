import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';

class SideListTheme extends ThemeExtension<SideListTheme> {
  // Layout & sizing
  final double minWidth; // full panel min (icons + content)
  final double maxWidth;
  final double initialExpandedWidth;
  final double collapsedWidth;
  final double iconsRailWidth; // rail width when expanded
  final double headerHeight;
  final double itemHeight;

  // Drag bounds (fallback to min/max)
  final double? dragMinWidth;
  final double? dragMaxWidth;

  // Handle & motion
  final double resizeHandleWidth;
  final Duration animationDuration;
  final Curve animationCurve;

  // Icons/rail visuals
  final double pageSpacing;
  final EdgeInsets railPadding; // inner padding around the rail
  final BorderRadius railItemRadius;

  // Colors
  final Color? railBackgroundColor;
  final Color? contentBackgroundColor;
  final Color? selectedItemBackgroundColor;
  final Color? handleBorderColor;
  final Color? handleBorderHoverColor;

  // Icon button themes
  final HoverIconTheme? iconTheme;
  final HoverIconTheme? chevronIconTheme;

  const SideListTheme({
    // Layout
    this.minWidth = 160.0,
    this.maxWidth = 420.0,
    this.initialExpandedWidth = 320.0,
    this.collapsedWidth = 72.0,
    this.iconsRailWidth = 72.0,
    this.headerHeight = 40.0,
    this.itemHeight = 32,

    // Drag
    this.dragMinWidth,
    this.dragMaxWidth,

    // Motion
    this.resizeHandleWidth = 8.0,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeOut,

    // Icons
    this.pageSpacing = 8.0,
    this.railPadding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    this.railItemRadius = const BorderRadius.all(Radius.circular(10)),

    // Colors
    this.railBackgroundColor,
    this.contentBackgroundColor,
    this.selectedItemBackgroundColor,
    this.handleBorderColor,
    this.handleBorderHoverColor,

    // Icon button themes
    this.iconTheme,
    this.chevronIconTheme,
  });

  factory SideListTheme.fromBrightness(Brightness b)
    => b == Brightness.dark ? SideListTheme.dark : SideListTheme.light;

  static final SideListTheme light = SideListTheme(
    railBackgroundColor: const Color(0xFFF6F7F9),
    contentBackgroundColor: Colors.white,
    selectedItemBackgroundColor: const Color(0x141A73E8),
    handleBorderColor: const Color(0xFFB0B6BE),
    handleBorderHoverColor: const Color(0xFF1A73E8),
  );

  static final SideListTheme dark = SideListTheme(
    railBackgroundColor: const Color(0xFF1C1F24),
    contentBackgroundColor: const Color(0xFF111316),
    selectedItemBackgroundColor: const Color(0x14FFFFFF),
    handleBorderColor: const Color(0xFF6B6F76),
    handleBorderHoverColor: const Color(0xFF8AB4F8),
  );

  @override
  SideListTheme copyWith({
    double? minWidth,
    double? maxWidth,
    double? initialExpandedWidth,
    double? collapsedWidth,
    double? iconsRailWidth,
    double? headerHeight,
    double? itemHeight,
    double? dragMinWidth,
    double? dragMaxWidth,
    double? resizeHandleWidth,
    Duration? animationDuration,
    Curve? animationCurve,
    double? pageSpacing,
    EdgeInsets? railPadding,
    BorderRadius? railItemRadius,
    Color? railBackgroundColor,
    Color? contentBackgroundColor,
    Color? selectedItemBackgroundColor,
    Color? handleBorderColor,
    Color? handleBorderHoverColor,
    HoverIconTheme? iconTheme,
    HoverIconTheme? chevronIconTheme,
  }) {
    return SideListTheme(
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      initialExpandedWidth: initialExpandedWidth ?? this.initialExpandedWidth,
      collapsedWidth: collapsedWidth ?? this.collapsedWidth,
      iconsRailWidth: iconsRailWidth ?? this.iconsRailWidth,
      headerHeight: headerHeight ?? this.headerHeight,
      itemHeight: itemHeight ?? this.itemHeight,
      dragMinWidth: dragMinWidth ?? this.dragMinWidth,
      dragMaxWidth: dragMaxWidth ?? this.dragMaxWidth,
      resizeHandleWidth: resizeHandleWidth ?? this.resizeHandleWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      pageSpacing: pageSpacing ?? this.pageSpacing,
      railPadding: railPadding ?? this.railPadding,
      railItemRadius: railItemRadius ?? this.railItemRadius,
      railBackgroundColor: railBackgroundColor ?? this.railBackgroundColor,
      contentBackgroundColor: contentBackgroundColor ?? this.contentBackgroundColor,
      selectedItemBackgroundColor: selectedItemBackgroundColor ?? this.selectedItemBackgroundColor,
      handleBorderColor: handleBorderColor ?? this.handleBorderColor,
      handleBorderHoverColor: handleBorderHoverColor ?? this.handleBorderHoverColor,
      iconTheme: iconTheme ?? this.iconTheme,
      chevronIconTheme: chevronIconTheme ?? this.chevronIconTheme,
    );
  }

  @override
  SideListTheme lerp(ThemeExtension<SideListTheme>? other, double t) {
    if (other is! SideListTheme) return this;
    return SideListTheme(
      minWidth: lerpDouble(minWidth, other.minWidth, t) ?? minWidth,
      maxWidth: lerpDouble(maxWidth, other.maxWidth, t) ?? maxWidth,
      initialExpandedWidth: lerpDouble(initialExpandedWidth, other.initialExpandedWidth, t) ?? initialExpandedWidth,
      collapsedWidth: lerpDouble(collapsedWidth, other.collapsedWidth, t) ?? collapsedWidth,
      iconsRailWidth: lerpDouble(iconsRailWidth, other.iconsRailWidth, t) ?? iconsRailWidth,
      headerHeight: lerpDouble(headerHeight, other.headerHeight, t) ?? headerHeight,
      itemHeight: lerpDouble(itemHeight, other.itemHeight, t)!,
      dragMinWidth: lerpDouble(dragMinWidth, other.dragMinWidth, t),
      dragMaxWidth: lerpDouble(dragMaxWidth, other.dragMaxWidth, t),
      resizeHandleWidth: lerpDouble(resizeHandleWidth, other.resizeHandleWidth, t) ?? resizeHandleWidth,
      animationDuration: Duration(
        milliseconds: (animationDuration.inMilliseconds * (1 - t) + other.animationDuration.inMilliseconds * t).round(),
      ),
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      pageSpacing: lerpDouble(pageSpacing, other.pageSpacing, t) ?? pageSpacing,
      railPadding: EdgeInsets.lerp(railPadding, other.railPadding, t) ?? railPadding,
      railItemRadius: BorderRadius.lerp(railItemRadius, other.railItemRadius, t) ?? railItemRadius,
      railBackgroundColor: Color.lerp(railBackgroundColor, other.railBackgroundColor, t),
      contentBackgroundColor: Color.lerp(contentBackgroundColor, other.contentBackgroundColor, t),
      selectedItemBackgroundColor: Color.lerp(selectedItemBackgroundColor, other.selectedItemBackgroundColor, t),
      handleBorderColor: Color.lerp(handleBorderColor, other.handleBorderColor, t),
      handleBorderHoverColor: Color.lerp(handleBorderHoverColor, other.handleBorderHoverColor, t),
      iconTheme: t < 0.5 ? iconTheme : other.iconTheme,
      chevronIconTheme: t < 0.5 ? chevronIconTheme : other.chevronIconTheme,
    );
  }
}
