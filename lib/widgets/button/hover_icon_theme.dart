import 'dart:ui';

import 'package:flutter/material.dart';

class HoverIconTheme extends ThemeExtension<HoverIconTheme> {
  final Color? color;
  final Color? hoverColor;
  final Color? activeColor;
  final Color? selectedColor;

  final double size;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  
  const HoverIconTheme({
    this.color,
    this.hoverColor,
    this.activeColor,
    this.selectedColor,
    this.padding = EdgeInsets.zero,
    this.size = 32,
    this.constraints = const BoxConstraints(maxHeight: 48, minHeight: 12, maxWidth: 48, minWidth: 12),
  });

  @override
  HoverIconTheme copyWith({
    Color? color,
    Color? hoverColor,
    Color? activeColor,
    Color? selectedColor,

    double? size,
    EdgeInsets? padding,
    BoxConstraints? constraints,
  }) {
    return HoverIconTheme(
      color: color ?? this.color,
      hoverColor: hoverColor ?? this.hoverColor,
      activeColor: activeColor ?? this.activeColor,
      selectedColor: selectedColor ?? this.selectedColor,

      size: size ?? this.size,
      padding: padding ?? this.padding,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  HoverIconTheme lerp(ThemeExtension<HoverIconTheme>? other, double t) {
    if (other is! HoverIconTheme) return this;
    return HoverIconTheme(
      color: Color.lerp(color, other.color, t),
      hoverColor: Color.lerp(hoverColor, other.hoverColor, t),
      activeColor: Color.lerp(activeColor, other.activeColor, t),
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t),
      size: lerpDouble(size, other.size, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      constraints: BoxConstraints.lerp(constraints, other.constraints, t)!,
    );
  }
}
