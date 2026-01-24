import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_responsive_scope.dart';
import 'package:qjay/widgets/nav_rail/nav_rail_theme.dart';

ThemeData buildAdaptiveTheme({ required ThemeData baseTheme, required Brightness brightness, required double width }) {

  final layout = layoutClassForWidth(width);

  ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.grey.shade900,
    brightness: brightness,
  );

  if (brightness == Brightness.dark) {
    colorScheme = colorScheme.copyWith(
      surface: Colors.black,
      onSurface: Colors.grey.shade400,
      surfaceContainer: Colors.grey.shade900,
      onSurfaceVariant: Colors.white,
      
      primary: Colors.pinkAccent.shade400,
      onPrimary: Colors.white,
      primaryContainer: Colors.pinkAccent.shade700,
      onPrimaryContainer: Colors.grey.shade100,

      secondary: Colors.limeAccent.shade400,
      onSecondary: Colors.black,
      secondaryContainer: Colors.limeAccent.shade700,
      onSecondaryContainer: Colors.black,

      tertiary: Colors.blue.shade50,
      onTertiary: Colors.grey.shade900,
      tertiaryContainer: Colors.blueGrey.shade200,
      onTertiaryContainer: Colors.white,

      error: Colors.red.shade400,
      onError: Colors.black,
      errorContainer: Colors.red.shade900,
      onErrorContainer: Colors.white,

      shadow: Colors.blue.shade50.withValues(alpha: 0.12),
    );
  } else {
    colorScheme = colorScheme.copyWith(
      surface: Colors.white,
    );
  }

  final textTheme = baseTheme.textTheme.copyWith(
    displayLarge: baseTheme.textTheme.displayLarge?.copyWith(fontFamily: "Exo"),
    displayMedium: baseTheme.textTheme.displayMedium?.copyWith(fontFamily: "Exo"),
    displaySmall: baseTheme.textTheme.displaySmall?.copyWith(fontFamily: "Exo"),

    headlineLarge: baseTheme.textTheme.headlineLarge?.copyWith(fontFamily: "Exo"),
    headlineMedium: baseTheme.textTheme.headlineMedium?.copyWith(fontFamily: "Exo"),
    headlineSmall: baseTheme.textTheme.headlineSmall?.copyWith(fontFamily: "Exo"),

    titleLarge: baseTheme.textTheme.titleLarge?.copyWith(fontFamily: "Poppins"),
    titleMedium: baseTheme.textTheme.titleMedium?.copyWith(fontFamily: "Poppins"),
    titleSmall: baseTheme.textTheme.titleSmall?.copyWith(fontFamily: "Poppins"),

    bodyLarge: baseTheme.textTheme.bodyLarge?.copyWith(fontFamily: "Poppins"),
    bodyMedium: baseTheme.textTheme.bodyMedium?.copyWith(fontFamily: "Poppins"),
    bodySmall: baseTheme.textTheme.bodySmall?.copyWith(fontFamily: "Poppins"),

    labelLarge: baseTheme.textTheme.labelLarge?.copyWith(fontFamily: "Poppins"),
    labelMedium: baseTheme.textTheme.labelMedium?.copyWith(fontFamily: "Poppins"),
    labelSmall: baseTheme.textTheme.labelSmall?.copyWith(fontFamily: "Poppins"),
  );

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,

    scaffoldBackgroundColor: colorScheme.surface,
    hoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
    highlightColor: colorScheme.primary.withValues(alpha: 0.1),
    splashColor: Colors.transparent,

    appBarTheme: AppBarThemeData(
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 56,
      centerTitle: false,
      backgroundColor: colorScheme.surface,
    ),

    iconTheme: IconThemeData(
      size: 24,
      color: colorScheme.onSurface,
      shadows: [Shadow(color: colorScheme.onSurface.withValues(alpha: 0.3), offset: Offset(1, 1))],
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(24),
        iconColor: WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.error: colorScheme.error,
          WidgetState.hovered & WidgetState.focused: colorScheme.primary.withValues(alpha: 0.3),
          WidgetState.selected: colorScheme.primary,
          WidgetState.any: colorScheme.onSurface,
        }),
      )
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface,
    ),

    extensions: <ThemeExtension<dynamic>>[

      NavRailTheme(
        itemSpacing: 0,
        contentPadding: EdgeInsets.zero,
        itemTheme: NavRailItemTheme(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          iconLeftSpacing: 4,
          textInnerSpacing: 2,
        )
      ),
    ],
  );
}

class AdaptiveThemes {
  final ThemeData light;
  final ThemeData dark;
  const AdaptiveThemes({required this.light, required this.dark});
}

AdaptiveThemes buildAdaptiveLightDarkForWidth(BuildContext context) {
  final base = ThemeData(useMaterial3: true);
  final light = buildAdaptiveTheme(baseTheme: base, brightness: Brightness.light, width: context.screenWidth);
  final dark  = buildAdaptiveTheme(baseTheme: base, brightness: Brightness.dark,  width: context.screenWidth);
  return AdaptiveThemes(light: light, dark: dark);
}
