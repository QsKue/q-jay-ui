import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon.dart';

import 'nav_rail_theme.dart';

class NavRailItem<T> extends StatefulWidget {
  final NavRailItemTheme? theme;

  final IconData icon;
  final IconData? hoverIcon;
  final IconData? playingIcon;

  final String title;
  final String subtitle;
  
  final bool isActive;
  final bool isPlaying;

  final VoidCallback? onPressed;
  final VoidCallback? onIconPressed;

  const NavRailItem({
    super.key,
    this.theme,
    required this.icon,
    this.hoverIcon,
    this.playingIcon,
    required this.title,
    required this.subtitle,
    this.isActive = false,
    this.isPlaying = false,
    this.onPressed,
    this.onIconPressed,
  });

  @override
  State<NavRailItem<T>> createState() => _NavRailItemState<T>();
}

class _NavRailItemState<T> extends State<NavRailItem<T>> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<NavRailItemTheme>()
      ?? Theme.of(context).extension<NavRailTheme>()?.itemTheme
      ?? NavRailItemTheme();

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final Color backgroundColor = widget.isActive
      ? theme.backgroundActiveColor ?? colorScheme.primary.withValues(alpha: 0.12)
      : _hovering
        ? theme.backgroundHoverColor ?? colorScheme.primary.withValues(alpha: 0.8)
        : theme.backgroundColor ?? colorScheme.surface;

    final Color foregroundColor = widget.isPlaying
      ? theme.foregroundPlayingColor ?? colorScheme.primary
      : _hovering
        ? theme.backgroundHoverColor ?? colorScheme.onSurface
        : theme.backgroundColor ?? colorScheme.onSurface;

    final Color foregroundSubColor = widget.isPlaying
      ? theme.foregroundPlayingColor ?? colorScheme.secondary
      : _hovering
        ? theme.backgroundHoverColor ?? colorScheme.onSurface
        : theme.backgroundColor ?? colorScheme.onSurface;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: _hovering ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: Container(
        color: backgroundColor,
        child: InkWell(
          onTap: widget.onPressed,
          child: Padding(
            padding: theme.padding,
            child: Row(
              spacing: theme.iconLeftSpacing,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      
                IconButton(
                  icon: Icon(widget.icon),
                  isSelected: widget.isPlaying,
                  onPressed: () {},
                ),
      
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        style: (theme.titleTextStyle ?? themeData.textTheme.bodyLarge)?.copyWith(
                          color: foregroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: theme.textInnerSpacing),

                      Text(
                        widget.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        style: (theme.subtitleTextStyle ?? themeData.textTheme.labelMedium)?.copyWith(
                          color: foregroundSubColor,
                          shadows: [Shadow(color: colorScheme.secondary.withValues(alpha: 0.3), offset: Offset(0.4, 0.4))],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
