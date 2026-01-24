import 'dart:math';

import 'package:flutter/material.dart';

import 'nav_rail_theme.dart';
export 'nav_rail_item.dart';

class NavRail extends StatefulWidget {
  final NavRailTheme? theme;
  
  final List<Widget> headerWidgets;
  final List<Widget> children;

  final double? width;

  const NavRail({
    super.key,
    this.theme,
    this.headerWidgets = const [],
    required this.children,
    this.width,
  });

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<NavRailTheme>()
      ?? NavRailTheme();
      
    final colorScheme = ColorScheme.of(context);

    return Material(
      color: theme.backgroundColor ?? colorScheme.surface,
      child: Padding(
        padding: theme.gutterPadding,
        child: AnimatedContainer(
          duration: theme.animationDuration,
          curve: theme.animationCurve,
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          
              // Header
              if (widget.headerWidgets.isNotEmpty)
                Padding(
                  padding: theme.headerPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: widget.headerWidgets,
                      ),
                    ],
                  ),
                ),
              
              // Content
              Expanded(
                child: Stack(
                  children: [
                        
                    if (widget.children.isNotEmpty)
                      Padding(
                        padding: theme.contentPadding,
                        child: ListView.builder(
                          controller: _scrollController,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.children.length,
                          itemBuilder: (context, i) => Padding(
                            padding: EdgeInsets.only(top: i == 0 ? 0 : theme.itemSpacing),
                            child: widget.children[i],
                          ),
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
}
