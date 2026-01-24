import 'package:flutter/material.dart';

import 'hover_icon_theme.dart';

class HoverIcon extends StatefulWidget {
  final HoverIconTheme? theme;

  final IconData icon;
  final IconData? hoverIcon;

  final bool isActive;
  final IconData? activeIcon;
  final IconData? activeHoverIcon;

  final Shadow? shadow;

  final bool isSelected;
  final String? hintText;

  final bool applyTextScaling;

  final bool iconOnly;
  final Function()? onPressed;

  const HoverIcon({
    super.key,
    this.theme,
    required this.icon,
    this.hoverIcon,
    this.isActive = false,
    this.activeIcon,
    this.activeHoverIcon,
    this.shadow,
    this.isSelected = false,
    this.hintText,
    this.applyTextScaling = false,
    this.iconOnly = false,
    this.onPressed,
  });

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<HoverIconTheme>()
      ?? HoverIconTheme();

    final colorScheme = ColorScheme.of(context);

    Color color = widget.isSelected
      ? theme.selectedColor ?? colorScheme.onPrimary
      : widget.isActive
        ? theme.activeColor ?? colorScheme.primary
        : _hovering ? theme.hoverColor ?? Theme.of(context).highlightColor : theme.color ?? colorScheme.onSurface;
    
    final icon = (
      widget.isActive
        ? _hovering ? widget.activeHoverIcon ?? widget.activeIcon : widget.activeIcon
        : _hovering ? widget.hoverIcon : widget.icon
    ) ?? widget.icon;

    final iconButton = IconButton(
      style: ButtonStyle(
        mouseCursor: widget.iconOnly ? WidgetStateProperty.all(SystemMouseCursors.basic) : null,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.padded,
        padding: WidgetStatePropertyAll(theme.padding),
      ),
      color: color,
      iconSize: theme.size,
      onPressed: widget.iconOnly ? () {} : widget.onPressed,
      constraints: theme.constraints,
      icon: Icon(icon, shadows: widget.shadow == null ? null : [widget.shadow!], applyTextScaling: widget.applyTextScaling)
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: widget.hintText != null
        ? Tooltip(
            message: widget.hintText,
            child: iconButton,
          )
        : iconButton,
    );
  }
}
