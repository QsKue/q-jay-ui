import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}

bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
bool get isDesktopDevice => !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

enum AppDevice { mobile, web, desktop }

bool get isWeb => kIsWeb;
bool get isMobilePlatform =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
     defaultTargetPlatform == TargetPlatform.iOS);
bool get isDesktopPlatform =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.macOS ||
     defaultTargetPlatform == TargetPlatform.windows ||
     defaultTargetPlatform == TargetPlatform.linux);

AppDevice deviceTypeOf(BuildContext context) {
  if (isWeb) {
    return AppDevice.web;
  }
  
  if (isMobilePlatform) {
    return AppDevice.mobile;
  }
  
  return AppDevice.desktop;
}

enum AppLayout { small, medium, large, wide }
enum ScaleFactor { small, medium, large, extraLarge }

class ScaleFactorSizing<T> {
  final T _smallFactorLimit;
  final T _mediumFactorLimit;
  final T _largeFactorLimit;
  final T _extraLargeFactorLimit;

  ScaleFactorSizing({ required T small, required T medium, required T large, required T extraLarge })
  : _smallFactorLimit = small, _mediumFactorLimit = medium, _largeFactorLimit = large, _extraLargeFactorLimit = extraLarge;
  
  T scaleForLayout(ScaleFactor layout) => switch (layout) {
      ScaleFactor.small => _smallFactorLimit,
      ScaleFactor.medium => _mediumFactorLimit,
      ScaleFactor.large => _largeFactorLimit,
      ScaleFactor.extraLarge => _extraLargeFactorLimit,
  };
}

@immutable
class AppBreakpoints {
  static const double compactMax = 600;
  static const double mediumMax = 1024;
  static const double expandedMax = 1440;
}

AppLayout layoutClassForWidth(double width) {
  if (width <= AppBreakpoints.compactMax) return AppLayout.small;
  if (width <= AppBreakpoints.mediumMax) return AppLayout.medium;
  if (width <= AppBreakpoints.expandedMax) return AppLayout.large;
  return AppLayout.wide;
}

@immutable
class ResponsiveData {
  final double width;
  final double height;
  final AppDevice device;
  final AppLayout layout;

  const ResponsiveData({
    required this.width,
    required this.height,
    required this.device,
    required this.layout,
  });

  bool get isCompact => layout == AppLayout.small;
  bool get isMedium => layout == AppLayout.medium;
  bool get isExpanded => layout == AppLayout.large;
  bool get isWide => layout == AppLayout.wide;
}

class ResponsiveScope extends StatelessWidget {
  final Widget child;
  const ResponsiveScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final device = deviceTypeOf(context);
        final layout = layoutClassForWidth(width);
        
        return _ResponsiveInherited(
          data: ResponsiveData(width: width, height: height, device: device, layout: layout),
          child: child,
        );
      },
    );
  }
}

class _ResponsiveInherited extends InheritedWidget {
  final ResponsiveData data;
  const _ResponsiveInherited({required this.data, required super.child});

  @override
  bool updateShouldNotify(_ResponsiveInherited oldWidget) =>
    oldWidget.data.width != data.width ||
    oldWidget.data.height != data.height ||
    oldWidget.data.layout != data.layout;
}

extension ResponsiveContext on BuildContext {
  ResponsiveData get responsive => dependOnInheritedWidgetOfExactType<_ResponsiveInherited>()!.data;

  AppDevice get device => responsive.device;
  AppLayout get layout => responsive.layout;

  bool get isCompact => responsive.isCompact;
  bool get isMedium => responsive.isMedium;
  bool get isExpanded => responsive.isExpanded;
  bool get isWide => responsive.isWide;

  double get screenWidth => responsive.width;
  double get screenHeight => responsive.height;
}
