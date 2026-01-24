import 'dart:async';

import 'package:flutter/material.dart';

import 'preset_view_delegates.dart';
import 'preset_view_draggable.dart';
import 'preset_view_theme.dart';

class PresetView extends StatefulWidget {
  final PresetViewTheme? theme;
  final PresetViewDragDataDelegate? dragDataDelegate;
  final PresetViewReorderDelegate? reorderDelegate;

  final String? builderKey;
  final Widget? header;
  final Widget? pinned;
  final PresetViewDataSource dataSource;
  final int itemCount;
  final int chunkSize;
  final int overscanChunks;

  const PresetView({
    super.key,
    this.theme,
    this.dragDataDelegate,
    this.reorderDelegate,
    this.builderKey,
    this.header,
    this.pinned,
    required this.dataSource,
    required this.itemCount,
    this.chunkSize = 10,
    this.overscanChunks = 1,
  });

  @override
  State<PresetView> createState() => _PresetViewState();
}

class _PresetViewState extends State<PresetView> {
  final ScrollController _scroll = ScrollController();
  Future<void> _prefetchQueue = Future.value();
  final Set<int> _fetchedChunks = <int>{};

  @override
  void didUpdateWidget(covariant PresetView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.builderKey != oldWidget.builderKey) {
      _fetchedChunks.clear();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_scroll.hasClients) {
          _scroll.jumpTo(0.0);
        }
      });
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  int _chunkForIndex(int index) => index ~/ widget.chunkSize;

  void _ensureAroundChunk(int chunk) {
    final overscan = widget.overscanChunks.clamp(0, 100);
    for (int k = chunk - overscan; k <= chunk + overscan; k++) {
      if (k < 0 || _fetchedChunks.contains(k)) continue;
      final start = k * widget.chunkSize;
      if (start >= widget.itemCount) continue;

      _fetchedChunks.add(k);

      final count = (start + widget.chunkSize <= widget.itemCount)
        ? widget.chunkSize
        : (widget.itemCount - start);

      _prefetchQueue = _prefetchQueue.then((_) => widget.dataSource.prefetchRange(start, count));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<PresetViewTheme>()
      ?? PresetViewTheme();

    final colorScheme = ColorScheme.of(context);

    final slivers = <Widget>[];

    if (widget.header != null) {
      slivers.add(SliverToBoxAdapter(child: Material(color: theme.backgroundColor ?? colorScheme.surface, child: widget.header!)));
    }

    if (widget.pinned != null) {
      slivers.add(PinnedHeaderSliver(child: Material(color: theme.backgroundColor ?? colorScheme.surface, child: widget.pinned!)));
    }

    slivers.add(
      SliverPadding(
        padding: theme.gutterPadding,
        sliver: SliverList.builder(
          key: widget.builderKey == null ? null : Key(widget.builderKey!),
          itemCount: widget.itemCount + 1,
          itemBuilder: (context, index) {
            if (index >= widget.itemCount) return const SizedBox();
            _ensureAroundChunk(_chunkForIndex(index));

            final child = widget.dataSource.itemAtIndex(context, index);
            final needsDnD =
                widget.dragDataDelegate != null || widget.reorderDelegate != null;
            if (!needsDnD) {
              return Padding(
                padding: EdgeInsets.only(bottom: theme.rowSpacing),
                child: child,
              );
            }

            return Padding(
              padding: EdgeInsets.only(bottom: theme.rowSpacing),
              child: PresetViewDraggableItem(
                theme: theme.dragTheme,
                badgeTheme: theme.badgeTheme,
                index: index,
                localSourceId: widget.dataSource.sourceId,
                dragDelegate: widget.dragDataDelegate,
                reorderDelegate: widget.reorderDelegate,
                child: child,
              ),
            );
          },
        ),
      ),
    );

    return CustomScrollView(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      controller: _scroll,
      slivers: [
        ...slivers,
        SliverFillRemaining(
          hasScrollBody: false,
          child: DragTarget<PresetDragData>(
            onWillAcceptWithDetails: (details) {
              final isLocal = widget.reorderDelegate != null &&
                  details.data.sourceId == widget.reorderDelegate!.sourceId &&
                  widget.reorderDelegate!.sourceId ==
                      widget.dataSource.sourceId;
              final isExternalOk = widget.dragDataDelegate != null &&
                  details.data.sourceId != widget.dataSource.sourceId &&
                  widget.dragDataDelegate!.canAccept(context, details.data.dragData);
              return isLocal || isExternalOk;
            },
            onAcceptWithDetails: (details) {
              final insertIndex = widget.itemCount;
              final isLocal = widget.reorderDelegate != null &&
                  details.data.sourceId == widget.reorderDelegate!.sourceId &&
                  widget.reorderDelegate!.sourceId ==
                      widget.dataSource.sourceId;
              if (isLocal) {
                var newIndex = insertIndex;
                if (details.data.sourceIndex < insertIndex) newIndex = insertIndex - 1;
                widget.reorderDelegate!
                    .onReorderRequested(context, details.data.sourceIndex, newIndex);
              } else if (widget.dragDataDelegate != null) {
                widget.dragDataDelegate!
                    .onExternalDrop(context, details.data.dragData, insertIndex);
              }
            },
            builder: (context, candidate, rejected) => const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
