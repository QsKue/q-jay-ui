import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qjay/widgets/feedback_badge/feedback_badge.dart';
import 'package:qjay/widgets/feedback_badge/feedback_badge_theme.dart';
import 'package:qjay/widgets/preset_view/preset_view_theme.dart';

import 'preset_view_delegates.dart';

enum _DropZone { none, above, below }

class PresetViewDraggableItem extends StatefulWidget {
  const PresetViewDraggableItem({
    super.key,
    this.theme,
    this.badgeTheme,  
    required this.index,
    required this.child,
    required this.localSourceId,
    this.dragDelegate,
    this.reorderDelegate,
  });

  final PresetViewDraggableItemTheme? theme;
  final FeedbackBadgeThemeData? badgeTheme;

  final int index;
  final Widget child;
  final Object localSourceId;
  final PresetViewDragDataDelegate? dragDelegate;
  final PresetViewReorderDelegate? reorderDelegate;

  @override
  State<PresetViewDraggableItem> createState() => _PresetViewDraggableItemState();
}

class _PresetViewDraggableItemState extends State<PresetViewDraggableItem> {
  final GlobalKey _boxKey = GlobalKey();
  _DropZone _zone = _DropZone.none;
  bool _accepting = false;

  bool get _isMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  void _updateZone(Offset globalPosition) {
    if (!_accepting) return;
    final box = _boxKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final local = box.globalToLocal(globalPosition);
    final h = box.size.height;
    if (h <= 0) return;
    final z = local.dy <= h / 2 ? _DropZone.above : _DropZone.below;
    if (_zone != z) setState(() => _zone = z);
  }

  Widget _wrapDraggable(Widget child) {
    final badgeTheme = widget.badgeTheme ?? FeedbackBadgeTheme.of(context) ?? FeedbackBadgeThemeData.base(context);
    
    final label = widget.reorderDelegate?.labelForIndex(context, widget.index) ??
        widget.dragDelegate?.labelForIndex(context, widget.index) ??
        '';

    final payload = PresetDragData(
      sourceId: widget.localSourceId,
      sourceIndex: widget.index,
      dragData: widget.dragDelegate?.dragDataForItem(context, widget.index),
    );

    if (_isMobile) {
      return LongPressDraggable<PresetDragData>(
        data: payload,
        feedback: FeedbackBadge(name: label, theme: badgeTheme),
        dragAnchorStrategy: pointerDragAnchorStrategy,
        maxSimultaneousDrags: 1,
        rootOverlay: true,
        onDragEnd: (_) => setState(() {
          _accepting = false;
          _zone = _DropZone.none;
        }),
        child: child,
      );
    } else {
      return Draggable<PresetDragData>(
        data: payload,
        feedback: FeedbackBadge(name: label, theme: badgeTheme),
        dragAnchorStrategy: pointerDragAnchorStrategy,
        maxSimultaneousDrags: 1,
        rootOverlay: true,
        onDragEnd: (_) => setState(() {
          _accepting = false;
          _zone = _DropZone.none;
        }),
        child: child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemTheme = widget.theme ?? Theme.of(context).extension<PresetViewTheme>()?.dragTheme ?? PresetViewDraggableItemTheme.base(context);

    final showTop = _accepting && _zone == _DropZone.above;
    final showBottom = _accepting && _zone == _DropZone.below;

    return DragTarget<PresetDragData>(
      onWillAccept: (p) {
        if (p == null) return false;

        final localOk = widget.reorderDelegate != null &&
            p.sourceId == widget.reorderDelegate!.sourceId &&
            widget.reorderDelegate!.sourceId == widget.localSourceId;

        final externalOk = widget.dragDelegate != null &&
            p.sourceId != widget.localSourceId &&
            widget.dragDelegate!.canAccept(context, p.dragData);

        final accept = localOk || externalOk;
        if (_accepting != accept) setState(() => _accepting = accept);
        if (!accept && _zone != _DropZone.none) setState(() => _zone = _DropZone.none);
        return accept;
      },
      onMove: (details) => _updateZone(details.offset),
      onLeave: (_) {
        if (_accepting || _zone != _DropZone.none) {
          setState(() {
            _accepting = false;
            _zone = _DropZone.none;
          });
        }
      },
      onAccept: (p) {
        final insertIndex = _zone == _DropZone.above ? widget.index : widget.index + 1;

        final isLocal = widget.reorderDelegate != null &&
            p.sourceId == widget.reorderDelegate!.sourceId &&
            widget.reorderDelegate!.sourceId == widget.localSourceId;

        if (isLocal) {
          var newIndex = insertIndex;
          if (p.sourceIndex < insertIndex) newIndex = insertIndex - 1;
          widget.reorderDelegate!.onReorderRequested(context, p.sourceIndex, newIndex);
        } else if (widget.dragDelegate != null) {
          widget.dragDelegate!.onExternalDrop(context, p.dragData, insertIndex);
        }

        setState(() {
          _accepting = false;
          _zone = _DropZone.none;
        });
      },
      builder: (context, candidate, rejected) => Column(
        key: _boxKey,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showTop)
            Container(
              height: itemTheme.indicatorThickness,
              color: itemTheme.indicatorColor,
            ),
          _wrapDraggable(widget.child),
          if (showBottom)
            Container(
              height: itemTheme.indicatorThickness,
              color: itemTheme.indicatorColor,
            ),
        ],
      ),
    );
  }
}