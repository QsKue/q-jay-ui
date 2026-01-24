import 'package:flutter/material.dart';

import 'preset_banner_theme.dart';

class PresetBannerBar extends StatefulWidget {
  final PresetBannerSelectionBarTheme? theme;

  final IconData leadingIcon;
  final List<String> items;

  final String currentValue;
  
  final int selectedIndex;
  final void Function(int index) onTapIndex;

  final bool hasTopBorder;

  const PresetBannerBar({
    super.key,
    this.theme,
    required this.leadingIcon,
    required this.items,
    required this.currentValue,
    required this.selectedIndex,
    required this.onTapIndex,
    this.hasTopBorder = true,
  });

  @override
  State<PresetBannerBar> createState() => _PresetBannerBarState();
}

class _PresetBannerBarState extends State<PresetBannerBar> {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<PresetBannerSelectionBarTheme>()
      ?? PresetBannerSelectionBarTheme();

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    bool isCurrent(int index) => widget.currentValue == widget.items[index];

    Color backgroundColor(int index) => index == widget.selectedIndex
      ? theme.backgroundSelectedColor ?? colorScheme.primaryContainer
      : isCurrent(index)
        ? _hoverIndex == index
          ? theme.backgroundHoverColor ?? colorScheme.secondaryContainer.withValues(alpha: 0.6)
          : theme.backgroundColor ?? colorScheme.secondaryContainer
        : _hoverIndex == index
          ? theme.backgroundHoverColor ?? themeData.hoverColor
          : theme.backgroundColor ?? colorScheme.surfaceContainer;

    Color foregroundColor(int index) => index == widget.selectedIndex
      ? theme.foregroundSelectedColor ?? colorScheme.onPrimaryContainer
      : isCurrent(index)
        ? _hoverIndex == index
          ? theme.foregroundHoverColor ?? colorScheme.onSecondaryContainer
          : theme.foregroundColor ?? colorScheme.onSecondaryContainer
        : _hoverIndex == index
          ? theme.foregroundHoverColor ?? colorScheme.onPrimaryContainer
          : theme.foregroundColor ?? colorScheme.onSurface;

    Border border(int index) {
      final borderSide = BorderSide(width: theme.borderWidth, color: theme.borderColor ?? Colors.transparent);

      return theme.itemSpacing == 0
        ? Border(left: index == 0 ? borderSide : BorderSide.none, top: widget.hasTopBorder ? borderSide : BorderSide.none, right: borderSide, bottom: borderSide)
        : Border.fromBorderSide(borderSide);
    }

    return IntrinsicHeight(
      child: Row(
        children: [
      
          Icon(
            widget.leadingIcon,
            size: 40,
            color: colorScheme.onSurface,
          ),

          SizedBox(width: theme.iconLeftSpacing),
            
          Expanded(
            child: Row(
              spacing: theme.itemSpacing,
              children: [
                for (var i = 0; i < widget.items.length; i++) ...[
                  Expanded(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoverIndex = i),
                      onExit: (_) => setState(() => _hoverIndex = -1),
                      child: InkWell(
                        onTap: () => widget.onTapIndex(i),
                        child: Container(
                          decoration: BoxDecoration(
                            border: border(i),
                            borderRadius: theme.itemSpacing == 0 ? null : BorderRadius.all(Radius.circular(8)),
                            color: backgroundColor(i),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.items[i],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: (theme.textStyle ?? themeData.textTheme.labelLarge)?.copyWith(
                              color: foregroundColor(i),
                              fontWeight: i == widget.selectedIndex ? FontWeight.bold : null,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
