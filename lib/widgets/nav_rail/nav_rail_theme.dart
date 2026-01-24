import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon_theme.dart';

class NavRailTheme extends ThemeExtension<NavRailTheme> {
  final Color? backgroundColor;

  final EdgeInsetsGeometry gutterPadding;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry contentPadding;

  final Duration animationDuration;
  final Curve animationCurve;

  final double itemSpacing;

  final Color? dropShadowColor;
  final double dropShadowHeight;
  final double dropShadowOffset;
  final Duration dropShadowDelay;

  final NavRailItemTheme itemTheme;

  const NavRailTheme({
    this.backgroundColor,
    this.gutterPadding = const EdgeInsets.fromLTRB(4, 0, 4, 4),
    this.headerPadding = const EdgeInsets.symmetric(vertical: 4),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 4),
    this.animationDuration = const Duration(milliseconds: 180),
    this.animationCurve = Curves.easeInOut,
    this.itemSpacing = 2,
    this.dropShadowColor,
    this.dropShadowHeight = 18,
    this.dropShadowOffset = 24,
    this.dropShadowDelay = const Duration(milliseconds: 20),
    this.itemTheme = const NavRailItemTheme(),
  });

  @override
  ThemeExtension<NavRailTheme> copyWith({
    Color? backgroundColor,

    EdgeInsetsGeometry? gutterPadding,
    EdgeInsetsGeometry? headerPadding,
    EdgeInsetsGeometry? contentPadding,

    Duration? animationDuration,
    Curve? animationCurve,

    double? itemSpacing,

    Color? dropShadowColor,
    double? dropShadowHeight,
    double? dropShadowOffset,
    Duration? dropShadowDelay,

    NavRailItemTheme? itemTheme,
  })
   => NavRailTheme(
    backgroundColor: backgroundColor ?? this.backgroundColor,

    gutterPadding: gutterPadding ?? this.gutterPadding,
    headerPadding: headerPadding ?? this.headerPadding,
    contentPadding: contentPadding ?? this.contentPadding,

    animationDuration: animationDuration ?? this.animationDuration,
    animationCurve: animationCurve ?? this.animationCurve,

    itemSpacing: itemSpacing ?? this.itemSpacing,

    dropShadowColor: dropShadowColor ?? this.dropShadowColor,
    dropShadowHeight: dropShadowHeight ?? this.dropShadowHeight,
    dropShadowOffset: dropShadowOffset ?? this.dropShadowOffset,
    dropShadowDelay: dropShadowDelay ?? this.dropShadowDelay,

    itemTheme: itemTheme ?? this.itemTheme,
   );

  @override
  NavRailTheme lerp(ThemeExtension<NavRailTheme>? other, double t) {
    if (other is! NavRailTheme) return this;
    return NavRailTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),

      gutterPadding: EdgeInsetsGeometry.lerp(gutterPadding, other.gutterPadding, t)!,
      headerPadding: EdgeInsetsGeometry.lerp(headerPadding, other.headerPadding, t)!,
      contentPadding: EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t)!,

      animationDuration: lerpDuration(animationDuration, other.animationDuration, t),
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,

      itemSpacing: lerpDouble(itemSpacing, other.itemSpacing, t)!,

      dropShadowColor: Color.lerp(dropShadowColor, other.dropShadowColor, t),
      dropShadowHeight: lerpDouble(dropShadowHeight, other.dropShadowHeight, t)!,
      dropShadowOffset: lerpDouble(dropShadowOffset, other.dropShadowOffset, t)!,
      dropShadowDelay: lerpDuration(dropShadowDelay, other.dropShadowDelay, t),

      itemTheme: itemTheme.lerp(other.itemTheme, t),
    );
  }
}

class NavRailItemTheme extends ThemeExtension<NavRailItemTheme> {
  final Color? backgroundColor;
  final Color? backgroundHoverColor;
  final Color? backgroundActiveColor;
  final Color? foregroundColor;
  final Color? foregroundHoverColor;
  final Color? foregroundActiveColor;
  final Color? foregroundPlayingColor;

  final Color? placeholderBackgroundColor;
  final BorderRadiusGeometry placeholderBorderRadius;

  final EdgeInsetsGeometry padding;
  final double iconLeftSpacing;
  final double textInnerSpacing;

  final Duration animationDuration;
  final Curve animationCurve;

  final HoverIconTheme iconTheme;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  const NavRailItemTheme({
    this.backgroundColor,
    this.backgroundHoverColor,
    this.backgroundActiveColor,
    this.foregroundColor,
    this.foregroundHoverColor,
    this.foregroundActiveColor,
    this.foregroundPlayingColor,

    this.placeholderBackgroundColor,
    this.placeholderBorderRadius = const BorderRadius.all(Radius.circular(8)),
    
    this.padding = const EdgeInsets.all(4),
    this.iconLeftSpacing = 4,
    this.textInnerSpacing = 4,

    this.animationDuration = const Duration(milliseconds: 420),
    this.animationCurve = Curves.linear,

    this.iconTheme = const HoverIconTheme(),
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  @override
  ThemeExtension<NavRailItemTheme> copyWith({
    Color? backgroundColor,
    Color? backgroundHoverColor,
    Color? backgroundActiveColor,
    Color? foregroundColor,
    Color? foregroundHoverColor,
    Color? foregroundActiveColor,
    Color? foregroundPlayingColor,

    Color? placeholderBackgroundColor,
    BorderRadiusGeometry? placeholderBorderRadius,

    EdgeInsetsGeometry? padding,
    double? iconLeftSpacing,
    double? textInnerSpacing,

    Duration? animationDuration,
    Curve? animationCurve,

    HoverIconTheme? iconTheme,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  })
   => NavRailItemTheme(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    backgroundHoverColor: backgroundHoverColor ?? this.backgroundHoverColor,
    backgroundActiveColor: backgroundActiveColor ?? this.backgroundActiveColor,
    foregroundColor: foregroundColor ?? this.foregroundColor,
    foregroundHoverColor: foregroundHoverColor ?? this.foregroundHoverColor,
    foregroundActiveColor: foregroundActiveColor ?? this.foregroundActiveColor,
    foregroundPlayingColor: foregroundPlayingColor ?? this.foregroundPlayingColor,

    placeholderBackgroundColor: placeholderBackgroundColor ?? this.placeholderBackgroundColor,
    placeholderBorderRadius: placeholderBorderRadius ?? this.placeholderBorderRadius,

    padding: padding ?? this.padding,
    iconLeftSpacing: iconLeftSpacing ?? this.iconLeftSpacing,
    textInnerSpacing: textInnerSpacing ?? this.textInnerSpacing,

    animationDuration: animationDuration ?? this.animationDuration,
    animationCurve: animationCurve ?? this.animationCurve,

    iconTheme: iconTheme ?? this.iconTheme,
    titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
   );

  @override
  NavRailItemTheme lerp(NavRailItemTheme? other, double t) {
    if (other is! NavRailItemTheme) return this;
    return NavRailItemTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      backgroundHoverColor: Color.lerp(backgroundHoverColor, other.backgroundHoverColor, t),
      backgroundActiveColor: Color.lerp(backgroundActiveColor, other.backgroundActiveColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      foregroundHoverColor: Color.lerp(foregroundHoverColor, other.foregroundHoverColor, t),
      foregroundActiveColor: Color.lerp(foregroundActiveColor, other.foregroundActiveColor, t),
      foregroundPlayingColor: Color.lerp(foregroundPlayingColor, other.foregroundPlayingColor, t),

      placeholderBackgroundColor: Color.lerp(placeholderBackgroundColor, other.placeholderBackgroundColor, t),
      placeholderBorderRadius: BorderRadiusGeometry.lerp(placeholderBorderRadius, other.placeholderBorderRadius, t)!,

      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      iconLeftSpacing: lerpDouble(iconLeftSpacing, other.iconLeftSpacing, t)!,
      textInnerSpacing: lerpDouble(textInnerSpacing, other.textInnerSpacing, t)!,

      animationDuration: lerpDuration(animationDuration, other.animationDuration, t),
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,

      iconTheme: iconTheme.lerp(other.iconTheme, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      subtitleTextStyle: TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t),
    );
  }
}