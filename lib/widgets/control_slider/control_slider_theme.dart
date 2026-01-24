import 'package:flutter/material.dart';

class ControlSliderTheme extends ThemeExtension<ControlSliderTheme> {
  final double trackHeight;
  final double thumbRadius;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final EdgeInsets padding;

  const ControlSliderTheme({
    this.trackHeight = 6,
    this.thumbRadius = 8,
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  ControlSliderTheme copyWith({
    double? trackHeight,
    double? thumbRadius,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    EdgeInsets? padding,
  }) => ControlSliderTheme(
        trackHeight: trackHeight ?? this.trackHeight,
        thumbRadius: thumbRadius ?? this.thumbRadius,
        activeColor: activeColor ?? this.activeColor,
        inactiveColor: inactiveColor ?? this.inactiveColor,
        thumbColor: thumbColor ?? this.thumbColor,
        padding: padding ?? this.padding,
      );

  @override
  ControlSliderTheme lerp(ThemeExtension<ControlSliderTheme>? other, double t) {
    if (other is! ControlSliderTheme) return this;
    return ControlSliderTheme(
      trackHeight: trackHeight + (other.trackHeight - trackHeight) * t,
      thumbRadius: thumbRadius + (other.thumbRadius - thumbRadius) * t,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}
