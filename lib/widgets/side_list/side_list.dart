import 'dart:async';
import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';

import 'side_list_theme.dart';

class SideList<T> extends StatefulWidget {
  final SideListTheme? theme;

  final List<T> pages;
  final T? initialPage;
  final IconData Function(T page) iconForPage;
  final IconData Function(T page)? hoverIconForPage;
  final Widget Function(T page) contentForPage;

  final bool collapsible;
  final bool? collapsed;
  final bool initialCollapsed;
  final ValueChanged<bool>? onCollapsedChanged;

  final FutureOr<bool> Function(T page, bool isCollapsed)? onPageTap;
  final String Function(T page)? tooltipForPage;

  final double? width;

  final ValueChanged<T>? onItemClick;

  const SideList({
    super.key,
    this.theme,
    required this.pages,
    required this.iconForPage,
    this.hoverIconForPage,
    required this.contentForPage,
    this.initialPage,
    this.collapsible = true,
    this.collapsed,
    this.initialCollapsed = false,
    this.onCollapsedChanged,
    this.onPageTap,
    this.tooltipForPage,
    this.width,
    this.onItemClick,
  });

  @override
  State<SideList<T>> createState() => _SideListState<T>();
}

class _SideListState<T> extends State<SideList<T>> with SingleTickerProviderStateMixin {
  late bool _collapsed;
  T? _selectedPage;

  bool get _isCollapsible => widget.collapsible;
  bool get _isCollapsedControlled => widget.collapsed != null;
  bool get _effectiveCollapsed => !widget.collapsible ? true : (_isCollapsedControlled ? widget.collapsed! : _collapsed);

  SideListTheme get _theme {
    final provided = widget.theme;
    if (provided != null) return provided;
    return Theme.of(context).extension<SideListTheme>() ??
        SideListTheme.fromBrightness(Theme.of(context).brightness);
  }

  @override
  void initState() {
    super.initState();
    _collapsed = widget.collapsed ?? widget.initialCollapsed;
    _selectedPage = widget.initialPage ?? (widget.pages.isNotEmpty ? widget.pages.first : null);
  }

  @override
  void didUpdateWidget(covariant SideList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_selectedPage != null && !widget.pages.contains(_selectedPage)) {
      _selectedPage = widget.pages.isNotEmpty ? widget.pages.first : null;
    }
    if (_isCollapsedControlled) {
      _collapsed = widget.collapsed!;
    }
  }

  void _toggleCollapse() {
    if (!_isCollapsible) return;
    if (_isCollapsedControlled) {
      widget.onCollapsedChanged?.call(!_effectiveCollapsed);
      return;
    }
    setState(() {
      _collapsed = !_collapsed;
    });
    widget.onCollapsedChanged?.call(_collapsed);
  }

  Future<void> _selectPage(T page) async {
    bool allowDefault = true;
    if (widget.onPageTap != null) {
      final result = await Future.value(widget.onPageTap!(page, _effectiveCollapsed));
      allowDefault = result != false;
    }
    setState(() => _selectedPage = page);
    if (_isCollapsible) {
      if (allowDefault && _effectiveCollapsed) {
        if (_isCollapsedControlled) {
          widget.onCollapsedChanged?.call(false);
        } else {
          setState(() {
            _collapsed = false;
          });
          widget.onCollapsedChanged?.call(false);
        }
      }
    } else {
      widget.onItemClick?.call(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    final clampedScale = MediaQuery.of(context).textScaleFactor;
    
    final double? targetWidth = _effectiveCollapsed
        ? _theme.collapsedWidth
        : widget.width;

    final hoverIconThemeFallback = Theme.of(context).extension<HoverIconTheme>();
    final hoverIconThemeForItems = _theme.iconTheme ?? hoverIconThemeFallback;
    final hoverIconThemeForChevron = _theme.chevronIconTheme ?? hoverIconThemeFallback;

    return SafeArea(
      child: AnimatedContainer(
        duration: _theme.animationDuration,
        curve: _theme.animationCurve,
        width: targetWidth,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: _effectiveCollapsed ? _theme.railBackgroundColor : _theme.contentBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _effectiveCollapsed ? targetWidth : _theme.iconsRailWidth * clampedScale,
              color: _theme.railBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!_isCollapsible)
                    SizedBox(height: 12),

                  if (_isCollapsible)
                    SizedBox(
                      height: _theme.headerHeight * clampedScale,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            HoverIcon(
                              icon: _effectiveCollapsed ? Icons.chevron_left : Icons.chevron_right,
                              hoverIcon: _effectiveCollapsed ? Icons.chevron_left : Icons.chevron_right,
                              hintText: _effectiveCollapsed ? 'Expand' : 'Collapse',
                              onPressed: _toggleCollapse,
                              theme: hoverIconThemeForChevron?.copyWith(
                                size: hoverIconThemeForChevron.size * clampedScale,
                              ),
                            ),
                        ],
                      ),
                    ),
                    
                  Expanded(
                    child: Padding(
                      padding: _theme.railPadding * clampedScale,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemCount: widget.pages.length,
                        separatorBuilder: (_, __) => SizedBox(height: _theme.pageSpacing),
                        itemBuilder: (context, index) {
                          final page = widget.pages[index];
                          final bool isSelected = page == _selectedPage;
                          final iconData = widget.iconForPage(page);
                          final hoverIconData = widget.hoverIconForPage?.call(page);
                          
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: isSelected ? _theme.selectedItemBackgroundColor : Colors.transparent,
                              borderRadius: _theme.railItemRadius,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0 * clampedScale),
                              child: HoverIcon(
                                icon: iconData,
                                hoverIcon: hoverIconData,
                                hintText: widget.tooltipForPage?.call(page),
                                onPressed: () => _selectPage(page),
                                theme: hoverIconThemeForItems?.copyWith(
                                  size: hoverIconThemeForItems.size * clampedScale,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!_effectiveCollapsed)
              Expanded(
                child: Container(
                  color: _theme.contentBackgroundColor,
                  child: AnimatedSwitcher(
                    duration: _theme.animationDuration,
                    switchInCurve: _theme.animationCurve,
                    switchOutCurve: _theme.animationCurve,
                    child: (_selectedPage != null)
                        ? KeyedSubtree(
                            key: ValueKey<Object?>(_selectedPage),
                            child: widget.contentForPage(_selectedPage as T),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
