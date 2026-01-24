import 'package:flutter/material.dart';

import 'rounded_button_theme.dart';

class RoundedButton extends StatelessWidget {
  final RoundedButtonTheme? theme;

  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;
  final bool? hovered;

  const RoundedButton({
    super.key,
    this.theme,
    required this.icon,
    this.tooltip,
    this.onPressed,
    this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    final rbTheme = theme
      ?? Theme.of(context).extension<RoundedButtonTheme>()
      ?? RoundedButtonTheme.fromBrightness(Theme.of(context).brightness);

    bool resolveHover(Set<MaterialState> states) {
      return (hovered ?? false) || states.contains(MaterialState.hovered);
    }

    Color? resolveBg(Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return rbTheme.disabledBackgroundColor;
      }
      return resolveHover(states)
        ? rbTheme.hoverBackgroundColor
        : rbTheme.backgroundColor;
    }

    Color? resolveFg(Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return rbTheme.disabledForegroundColor;
      }
      return resolveHover(states)
        ? rbTheme.hoverForegroundColor
        : rbTheme.foregroundColor;
    }

    return IconButton.filled(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: rbTheme.iconSize),
      style: ButtonStyle(
        // Visuals
        backgroundColor: MaterialStateProperty.resolveWith(resolveBg),
        foregroundColor: MaterialStateProperty.resolveWith(resolveFg),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,

        // Circular + sizing like your _controlIconStyle
        shape: const MaterialStatePropertyAll(CircleBorder()),
        minimumSize: MaterialStatePropertyAll(Size.square(rbTheme.size)),
        fixedSize: MaterialStatePropertyAll(Size.square(rbTheme.size)),
        padding: MaterialStatePropertyAll(rbTheme.padding),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
