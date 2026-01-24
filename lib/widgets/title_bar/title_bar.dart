import 'package:flutter/material.dart';

import 'package:qjay/widgets/button/hover_icon.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';
import 'package:window_manager/window_manager.dart';

import 'title_bar_theme.dart';

class TitleBar extends StatefulWidget {
  final TitleBarTheme? theme;

  final Widget leftIcon;
  final String? leftTooltip;
  final VoidCallback? onLeftPressed;
  final FocusNode? focusNode;

  final TextEditingController? searchController;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;

  const TitleBar({
    super.key,
    this.theme,
    required this.leftIcon,
    this.leftTooltip,
    this.onLeftPressed,
    this.focusNode,
    this.searchController,
    this.searchHint,
    this.onSearchChanged,
  });

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> with WindowListener {
  bool _isMaximized = true;
  bool _hover = false;

  late final TextEditingController _controller = widget.searchController ?? TextEditingController();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  TitleBarTheme get _theme {
    return widget.theme ??
        Theme.of(context).extension<TitleBarTheme>() ??
        TitleBarTheme.fromBrightness(Theme.of(context).brightness);
  }

  @override
  void onWindowMaximize() {
    setState(() => _isMaximized = true);
  }

  @override
  void onWindowUnmaximize() {
    setState(() => _isMaximized = false);
  }

  @override
  Widget build(BuildContext context) {
    final clampedScale = MediaQuery.of(context).textScaleFactor;
    final hoverIconThemeFallback = Theme.of(context).extension<HoverIconTheme>();
    final leftTheme = _theme.leftIconTheme ?? hoverIconThemeFallback;
    final windowTheme = _theme.windowIconTheme ?? hoverIconThemeFallback;

    return Material(
      color: _theme.backgroundColor,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: (_) => windowManager.startDragging(),
        onDoubleTap: () async {
          final isMax = await windowManager.isMaximized();
          isMax ? await windowManager.unmaximize() : await windowManager.maximize();
        },
        child: Container(
          constraints: BoxConstraints(minHeight: 54, maxHeight: 68),
          height: _theme.height * clampedScale,
          padding: _theme.padding,
          decoration: BoxDecoration(
            color: _theme.backgroundColor,
            border: Border(bottom: BorderSide(color: _theme.dividerColor ?? Colors.transparent)),
          ),
          child: Row(
            children: [
              // Left icon
              Expanded(
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: widget.leftIcon,
                ),
              ),
              Center(
                child: MouseRegion(
                  onEnter: (_) => setState(() => _hover = true),
                  onExit: (_) => setState(() => _hover = false),
                  child: widget.onSearchChanged == null ? SizedBox() : Container(
                    constraints: BoxConstraints(minHeight: 32, maxHeight: 46),
                    height: _theme.searchHeight * clampedScale,
                    width: _theme.searchWidth,
                    decoration: BoxDecoration(
                      color: _theme.searchFillColor,
                      borderRadius: _theme.searchRadius,
                      border: Border.all(
                        width: 1,
                        color: _hover ? (_theme.searchBorderHoverColor ?? Colors.transparent) : (_theme.searchBorderColor ?? Colors.transparent),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    child: TextField(
                      focusNode: widget.focusNode,
                      controller: _controller,
                      onChanged: widget.onSearchChanged,
                      style: _theme.searchTextStyle,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration.collapsed(
                        hintText: widget.searchHint ?? 'Search',
                        hintStyle: _theme.searchHintStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(
                    //   width: 120,
                    //   child: Slider(
                    //     min: 0,
                    //     max: 3,
                    //     value: ThemeController.of(context).scaleFactor.index.toDouble(),
                    //     onChanged: (v) => ThemeController.of(context).setScaleFactor(ScaleFactor.values[v.toInt()]),
                    //   ),
                    // ),
                    SizedBox(
                      width: _theme.windowIconWidth,
                      child: HoverIcon(
                        icon: Icons.remove,
                        hoverIcon: Icons.remove,
                        hintText: 'Minimize',
                        onPressed: () => windowManager.minimize(),
                        theme: windowTheme,
                      ),
                    ),
                    SizedBox(
                      width: _theme.windowIconWidth,
                      child: HoverIcon(
                        icon: _isMaximized ? Icons.filter_none : Icons.crop_square,
                        hoverIcon: _isMaximized ? Icons.filter_none : Icons.crop_square,
                        hintText: _isMaximized ? 'Restore' : 'Maximize',
                        onPressed: () {
                          _isMaximized ? windowManager.unmaximize() : windowManager.maximize();
                        },
                        theme: windowTheme,
                      ),
                    ),
                    SizedBox(
                      width: _theme.windowIconWidth,
                      child: HoverIcon(
                        icon: Icons.close,
                        hoverIcon: Icons.close,
                        hintText: 'Close',
                        onPressed: () => windowManager.close(),
                        theme: windowTheme,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }
}
