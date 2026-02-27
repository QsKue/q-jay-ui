import 'package:flutter/material.dart';

enum ScreenSize {
  compact,
  medium,
  expanded,
  large;

  static ScreenSize fromWidth(double width) {
    if (width >= 1440) return ScreenSize.large;
    if (width >= 1024) return ScreenSize.expanded;
    if (width >= 600) return ScreenSize.medium;
    return ScreenSize.compact;
  }
}

extension ResponsiveContext on BuildContext {
  ScreenSize get screenSize => ScreenSize.fromWidth(MediaQuery.sizeOf(this).width);
}