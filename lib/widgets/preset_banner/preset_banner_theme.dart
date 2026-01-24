import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon.dart';

import 'package:qjay/widgets/button/hover_icon_theme.dart';
import 'package:qjay/widgets/button/rounded_button_theme.dart';

class PresetBannerSelectionTheme extends ThemeExtension<PresetBannerSelectionTheme> {
  final Color? backgroundColor;
  final EdgeInsetsGeometry gutterPadding;
  final double barSpacing;

  const PresetBannerSelectionTheme({
    this.backgroundColor,
    this.gutterPadding = const EdgeInsets.fromLTRB(4, 16, 12 , 16),
    this.barSpacing = 12,
  });

  @override
  PresetBannerSelectionTheme copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? gutterPadding,
    double? barSpacing,
  })
    => PresetBannerSelectionTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      gutterPadding: gutterPadding ?? this.gutterPadding,
      barSpacing: barSpacing ?? this.barSpacing,
    );

  @override
  PresetBannerSelectionTheme lerp(PresetBannerSelectionTheme? other, double t) {
    if (other is! PresetBannerSelectionTheme) return this;
    return PresetBannerSelectionTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      gutterPadding: EdgeInsetsGeometry.lerp(gutterPadding, other.gutterPadding, t)!,
      barSpacing: lerpDouble(barSpacing, other.barSpacing, t)!,
    );
  }

}

class PresetBannerSelectionBarTheme extends ThemeExtension<PresetBannerSelectionTheme> {
  final Color? backgroundColor;
  final Color? backgroundHoverColor;
  final Color? backgroundSelectedColor;

  final Color? foregroundColor;
  final Color? foregroundHoverColor;
  final Color? foregroundSelectedColor;

  final Color? borderColor;
  final double borderWidth;

  final double iconLeftSpacing;
  final double itemSpacing;

  final TextStyle? textStyle;

  const PresetBannerSelectionBarTheme({
    this.backgroundColor,
    this.backgroundHoverColor,
    this.backgroundSelectedColor,

    this.foregroundColor,
    this.foregroundHoverColor,
    this.foregroundSelectedColor,

    this.borderColor,
    this.borderWidth = 1,

    this.iconLeftSpacing = 4,
    this.itemSpacing = 8,

    this.textStyle,
  });

  @override
  PresetBannerSelectionBarTheme copyWith({
    Color? backgroundColor,
    Color? backgroundHoverColor,
    Color? backgroundSelectedColor,

    Color? foregroundColor,
    Color? foregroundHoverColor,
    Color? foregroundSelectedColor,

    Color? borderColor,
    double? borderWidth,

    double? iconLeftSpacing,
    double? itemSpacing,

    TextStyle? textStyle,
  })
    => PresetBannerSelectionBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundHoverColor: backgroundHoverColor ?? this.backgroundHoverColor,
      backgroundSelectedColor: backgroundSelectedColor ?? this.backgroundSelectedColor,

      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundHoverColor: foregroundHoverColor ?? this.foregroundHoverColor,
      foregroundSelectedColor: foregroundSelectedColor ?? this.foregroundSelectedColor,

      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,

      iconLeftSpacing: iconLeftSpacing ?? this.iconLeftSpacing,
      itemSpacing: itemSpacing ?? this.itemSpacing,

      textStyle: textStyle ?? this.textStyle,
    );

  @override
  PresetBannerSelectionBarTheme lerp(PresetBannerSelectionBarTheme? other, double t) {
    if (other is! PresetBannerSelectionBarTheme) return this;
    return PresetBannerSelectionBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      backgroundHoverColor: Color.lerp(backgroundHoverColor, other.backgroundHoverColor, t),
      backgroundSelectedColor: Color.lerp(backgroundSelectedColor, other.backgroundSelectedColor, t),

      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      foregroundHoverColor: Color.lerp(foregroundHoverColor, other.foregroundHoverColor, t),
      foregroundSelectedColor: Color.lerp(foregroundSelectedColor, other.foregroundSelectedColor, t),

      borderColor: Color.lerp(borderColor, other.borderColor, t),
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,

      iconLeftSpacing: lerpDouble(iconLeftSpacing, other.iconLeftSpacing, t)!,
      itemSpacing: lerpDouble(itemSpacing, other.itemSpacing, t)!,

      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }

}

// Main Theme
class PresetBannerThemeDataLegacy {
  final Color backgroundColor;
  final EdgeInsets gutterPadding;
  final EdgeInsets actionsPadding;
  final EdgeInsets barsPadding;

  final double actionsSpacing;
  final double actionButtonsSpacing;

  final RoundedButtonTheme? playButtonTheme;
  final HoverIconTheme? otherButtonsTheme;

  final PresetBarsThemeDataLegacy? barTheme;

  const PresetBannerThemeDataLegacy({
    this.backgroundColor = Colors.transparent,
    this.gutterPadding = const EdgeInsets.all(12),
    this.actionsPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.barsPadding = const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    this.actionsSpacing = 10,
    this.actionButtonsSpacing = 8,
    this.playButtonTheme,
    this.otherButtonsTheme,
    this.barTheme,
  });

  PresetBannerThemeDataLegacy copyWith({
    Color? backgroundColor,
    EdgeInsets? gutterPadding,
    EdgeInsets? actionsPadding,
    EdgeInsets? barsPadding,
    double? actionsSpacing,
    double? actionButtonsSpacing,
    RoundedButtonTheme? playButtonTheme,
    HoverIconTheme? otherButtonsTheme,
    PresetBarsThemeDataLegacy? barTheme,
  }) {
    return PresetBannerThemeDataLegacy(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      gutterPadding: gutterPadding ?? this.gutterPadding,
      actionsPadding: actionsPadding ?? this.actionsPadding,
      barsPadding: barsPadding ?? this.barsPadding,
      actionsSpacing: actionsSpacing ?? this.actionsSpacing,
      actionButtonsSpacing: actionButtonsSpacing ?? this.actionButtonsSpacing,
      playButtonTheme: playButtonTheme ?? this.playButtonTheme,
      otherButtonsTheme: otherButtonsTheme ?? this.otherButtonsTheme,
      barTheme: barTheme ?? this.barTheme,
    );
  }

  static PresetBannerThemeDataLegacy lerp(
    PresetBannerThemeDataLegacy a,
    PresetBannerThemeDataLegacy b,
    double t,
  ) {
    return PresetBannerThemeDataLegacy(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      gutterPadding: EdgeInsets.lerp(a.gutterPadding, b.gutterPadding, t)!,
      actionsPadding: EdgeInsets.lerp(a.actionsPadding, b.actionsPadding, t)!,
      barsPadding: EdgeInsets.lerp(a.barsPadding, b.barsPadding, t)!,
      actionsSpacing: lerpDouble(a.actionsSpacing, b.actionsSpacing, t)!,
      actionButtonsSpacing: lerpDouble(a.actionButtonsSpacing, b.actionButtonsSpacing, t)!,
      playButtonTheme: a.playButtonTheme?.lerp(b.playButtonTheme!, t),
      otherButtonsTheme:a.otherButtonsTheme?.lerp(b.otherButtonsTheme!, t),
      barTheme: a.barTheme?.lerp(b.barTheme!, t),
    );
  }

  factory PresetBannerThemeDataLegacy.base(BuildContext context) {
    return PresetBannerThemeDataLegacy(
      playButtonTheme: null,
      otherButtonsTheme: null,
    );
  }
}

class PresetBannerThemeLegacy extends InheritedTheme {
  const PresetBannerThemeLegacy({
    super.key,
    required this.data,
    required super.child,
  });

  final PresetBannerThemeDataLegacy data;

  static PresetBannerThemeDataLegacy? of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<PresetBannerThemeLegacy>();
    return inherited?.data;
  }

  @override
  bool updateShouldNotify(PresetBannerThemeLegacy oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return PresetBannerThemeLegacy(data: data, child: child);
  }
}

// Action Bar
class PresetBannerHeaderThemeData {
  final EdgeInsets padding;
  final double spacing;
  final TextStyle? textStyle;

  const PresetBannerHeaderThemeData({
    this.padding = const EdgeInsets.all(4),
    this.spacing = 8,
    this.textStyle,
  });

  PresetBannerHeaderThemeData copyWith({
    EdgeInsets? padding,
    double? spacing,
    TextStyle? textStyle,
  }) {
    return PresetBannerHeaderThemeData(
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  static PresetBannerHeaderThemeData lerp(
    PresetBannerHeaderThemeData a,
    PresetBannerHeaderThemeData b,
    double t,
  ) {
    return PresetBannerHeaderThemeData(
      padding: EdgeInsets.lerp(a.padding, b.padding, t)!,
      spacing: lerpDouble(a.spacing, b.spacing, t)!,
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
    );
  }

  factory PresetBannerHeaderThemeData.base(BuildContext context) {
    return PresetBannerHeaderThemeData(
      textStyle: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class PresetBannerHeaderTheme extends InheritedTheme {
  const PresetBannerHeaderTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final PresetBannerHeaderThemeData data;

  static PresetBannerHeaderThemeData? of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<PresetBannerHeaderTheme>();
    return inherited?.data;
  }

  @override
  bool updateShouldNotify(PresetBannerHeaderTheme oldWidget) => oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return PresetBannerHeaderTheme(data: data, child: child);
  }
}

class PresetBannerHeader extends StatelessWidget {
  final IconData? icon;
  final String? header;
  final VoidCallback? onHeaderIconPressed;
  final PresetBannerHeaderThemeData? theme;

  const PresetBannerHeader({
    super.key,
    this.icon,
    this.onHeaderIconPressed,
    this.header,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final t = theme ?? PresetBannerHeaderTheme.of(context) ?? PresetBannerHeaderThemeData.base(context);

    return Padding(
      padding: t.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            HoverIcon(
              icon: icon!,
              onPressed: onHeaderIconPressed,
            ),
          if (icon != null) SizedBox(width: t.spacing),
          if (header?.isNotEmpty ?? false)
            Expanded(
              child: Text(
                header!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: t.textStyle,
              ),
            ),
        ],
      ),
    );
  }
}

// Energy Bar
class PresetBarsThemeDataLegacy {
  final Color backgroundColor;
  final Color buttonsBackgroundColor;
  final Color iconBackgroundColor;

  final Color dividerColor;
  final double dividerThickness;

  final BorderRadius borderRadius;

  final TextStyle? textStyle;
  final FontWeight selectedFontWeight;
  final Color? selectedTextColor;

  final Color selectedBackgroundColor;
  final Color hoveredBackgroundColor;

  final HoverIconTheme? iconTheme;

  final double height;
  final EdgeInsets itemPadding;

  const PresetBarsThemeDataLegacy({
    required this.backgroundColor,
    required this.buttonsBackgroundColor,
    required this.iconBackgroundColor,
    required this.dividerColor,
    this.dividerThickness = 1,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textStyle,
    this.selectedFontWeight = FontWeight.w600,
    this.selectedTextColor,
    required this.selectedBackgroundColor,
    required this.hoveredBackgroundColor,
    required this.iconTheme,
    this.height = 32,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 10),
  });

  PresetBarsThemeDataLegacy copyWith({
    Color? backgroundColor,
    Color? buttonsBackgroundColor,
    Color? iconBackgroundColor,
    Color? dividerColor,
    double? dividerThickness,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    FontWeight? selectedFontWeight,
    Color? selectedTextColor,
    Color? selectedBackgroundColor,
    Color? hoveredBackgroundColor,
    HoverIconTheme? iconTheme,
    double? height,
    EdgeInsets? itemPadding,
  }) {
    return PresetBarsThemeDataLegacy(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonsBackgroundColor: buttonsBackgroundColor ?? this.buttonsBackgroundColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      selectedFontWeight: selectedFontWeight ?? this.selectedFontWeight,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      selectedBackgroundColor: selectedBackgroundColor ?? this.selectedBackgroundColor,
      hoveredBackgroundColor: hoveredBackgroundColor ?? this.hoveredBackgroundColor,
      iconTheme: iconTheme ?? this.iconTheme,
      height: height ?? this.height,
      itemPadding: itemPadding ?? this.itemPadding,
    );
  }

  PresetBarsThemeDataLegacy? lerp(
    PresetBarsThemeDataLegacy other,
    double t,
  ) {
    return PresetBarsThemeDataLegacy(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      buttonsBackgroundColor: Color.lerp(buttonsBackgroundColor, other.buttonsBackgroundColor, t)!,
      iconBackgroundColor: Color.lerp(iconBackgroundColor, other.iconBackgroundColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      dividerThickness: lerpDouble(dividerThickness, other.dividerThickness, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      selectedFontWeight: t < 0.5 ? selectedFontWeight : other.selectedFontWeight,
      selectedTextColor: Color.lerp(selectedTextColor, other.selectedTextColor, t),
      selectedBackgroundColor: Color.lerp(selectedBackgroundColor, other.selectedBackgroundColor, t)!,
      hoveredBackgroundColor: Color.lerp(hoveredBackgroundColor, other.hoveredBackgroundColor, t, )!,
      iconTheme: iconTheme?.lerp(other.iconTheme!, t),
      height: lerpDouble(height, other.height, t)!,
      itemPadding: EdgeInsets.lerp(itemPadding, other.itemPadding, t)!,
    );
  }

  factory PresetBarsThemeDataLegacy.base(BuildContext context) {
    final t = Theme.of(context);
    final p = t.colorScheme.primary;
    final onSurface = t.colorScheme.onSurface.withOpacity(0.87);

    return PresetBarsThemeDataLegacy(
      backgroundColor: t.colorScheme.surfaceContainerHighest,
      buttonsBackgroundColor: Colors.transparent,
      iconBackgroundColor: Colors.transparent,
      dividerColor: t.dividerColor,
      selectedBackgroundColor: p.withOpacity(0.12),
      hoveredBackgroundColor: t.colorScheme.onSurface.withOpacity(0.06),
      iconTheme: null,
      textStyle: t.textTheme.bodyMedium?.copyWith(color: onSurface, fontWeight: FontWeight.w500),
      selectedTextColor: null,
    );
  }
}

class PresetBarsTheme extends InheritedTheme {
  const PresetBarsTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final PresetBarsThemeDataLegacy data;

  static PresetBarsThemeDataLegacy? of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<PresetBarsTheme>();
    return inherited?.data;
  }

  @override
  bool updateShouldNotify(PresetBarsTheme oldWidget) => oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return PresetBarsTheme(data: data, child: child);
  }
}