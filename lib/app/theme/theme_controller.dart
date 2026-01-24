import 'package:flutter/material.dart';
import 'package:qjay/app/theme/app_responsive_scope.dart';

class ThemeController extends ChangeNotifier {
  ScaleFactor _scaleFactor;
  ScaleFactor get scaleFactor => _scaleFactor;

  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  ThemeController(this._scaleFactor);

  void toggleTheme() {
    _themeMode = switch (_themeMode) {
      ThemeMode.light  => ThemeMode.dark,
      ThemeMode.dark   => ThemeMode.light,
      ThemeMode.system => ThemeMode.dark,
    };

    notifyListeners();
  }

  void setScaleFactor(ScaleFactor factor) {
    _scaleFactor = factor;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  static ThemeController of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeControllerScope>()!.notifier!;
}

/// Inherited wrapper so you can call ThemeController.of(context)
class ThemeControllerScope extends InheritedNotifier<ThemeController> {
  const ThemeControllerScope({
    super.key,
    required ThemeController controller,
    required Widget child,
  }) : super(notifier: controller, child: child);
}
