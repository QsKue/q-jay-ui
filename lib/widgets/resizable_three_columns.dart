import 'package:flutter/material.dart';

class ResizableThreeColumns extends StatefulWidget {
  final Widget Function(double width) leftBuilder;
  final Widget center;
  final Widget Function(double width) rightBuilder;

  final double initialLeft;
  final double initialRight;

  final double minLeft;
  final double minRight;
  final double? maxLeft;
  final double? maxRight;

  final double handleHitWidth;
  final double handleLineWidth;

  final bool? rightCollapsed;
  final bool initialRightCollapsed;
  final ValueChanged<bool>? onRightCollapsedChanged;
  final double rightCollapsedWidth;
  final double rightCollapseThreshold;

  final Duration rightAnimationDuration;
  final Curve rightAnimationCurve;

  const ResizableThreeColumns({
    super.key,
    required this.leftBuilder,
    required this.center,
    required this.rightBuilder,
    this.initialLeft = 200,
    this.initialRight = 200,
    this.minLeft = 160,
    this.minRight = 200,
    this.maxLeft,
    this.maxRight,
    this.handleHitWidth = 4,
    this.handleLineWidth = 1,
    this.rightCollapsed,
    this.initialRightCollapsed = false,
    this.onRightCollapsedChanged,
    this.rightCollapsedWidth = 56,
    this.rightCollapseThreshold = 40,
    this.rightAnimationDuration = const Duration(milliseconds: 200),
    this.rightAnimationCurve = Curves.easeInOut,
  });

  @override
  State<ResizableThreeColumns> createState() => _ResizableThreeColumnsState();
}

class _ResizableThreeColumnsState extends State<ResizableThreeColumns> {
  late double _leftW = widget.initialLeft;
  late double _rightW = widget.initialRight;

  double _startDx = 0;
  double _startLeftW = 0;
  double _startRightW = 0;

  double _lastRightBeforeCollapse = 0;
  late bool _rightCollapsed = widget.rightCollapsed ?? widget.initialRightCollapsed;

  bool _isRightDragging = false;

  double get _maxLeft => widget.maxLeft ?? double.infinity;
  double get _maxRight => widget.maxRight ?? double.infinity;

  bool get _isRightCollapsedControlled => widget.rightCollapsed != null;
  bool get _effectiveRightCollapsed => _isRightCollapsedControlled ? widget.rightCollapsed! : _rightCollapsed;

  @override
  void didUpdateWidget(covariant ResizableThreeColumns oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isRightCollapsedControlled) {
      _rightCollapsed = widget.rightCollapsed!;
    }
  }

  void _setRightCollapsed(bool v) {
    if (_isRightCollapsedControlled) {
      widget.onRightCollapsedChanged?.call(v);
      return;
    }
    setState(() {
      _rightCollapsed = v;
    });
    widget.onRightCollapsedChanged?.call(v);
  }

  @override
  Widget build(BuildContext context) {
    _leftW = _leftW.clamp(widget.minLeft, _maxLeft);
    if (!_effectiveRightCollapsed) {
      _rightW = _rightW.clamp(widget.minRight, _maxRight);
    }

    final double rightLayoutWidth = _effectiveRightCollapsed ? widget.rightCollapsedWidth : _rightW;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(width: _leftW, child: widget.leftBuilder(_leftW)),

        _ResizeHandle(
          hitWidth: widget.handleHitWidth,
          lineWidth: widget.handleLineWidth,
          onDragStart: (dx) {
            _startDx = dx;
            _startLeftW = _leftW;
          },
          onDragUpdate: (dx) {
            final delta = dx - _startDx;
            final newLeft = _startLeftW + delta;
            setState(() => _leftW = newLeft.clamp(widget.minLeft, _maxLeft));
          },
          onDragEnd: () {},
        ),

        Expanded(child: widget.center),

        _ResizeHandle(
          hitWidth: widget.handleHitWidth,
          lineWidth: widget.handleLineWidth,
          onDragStart: (dx) {
            _isRightDragging = true;
            _startDx = dx;
            _startRightW = _rightW;
            if (!_effectiveRightCollapsed) {
              _lastRightBeforeCollapse = _rightW;
            }
            setState(() {});
          },
          onDragUpdate: (dx) {
            final delta = dx - _startDx;
            final candidate = _startRightW - delta;

            if (_effectiveRightCollapsed) {
              if (candidate >= widget.rightCollapseThreshold) {
                final restored = (_lastRightBeforeCollapse > 0 ? _lastRightBeforeCollapse : candidate)
                    .clamp(widget.minRight, _maxRight);
                setState(() {
                  _rightW = restored;
                });
                _setRightCollapsed(false);
              }
              return;
            }

            if (candidate <= widget.rightCollapseThreshold) {
              _lastRightBeforeCollapse = _rightW;
              _setRightCollapsed(true);
              return;
            }

            setState(() {
              _rightW = candidate.clamp(widget.minRight, _maxRight);
            });
          },
          onDragEnd: () {
            _isRightDragging = false;
            setState(() {});
          },
        ),

        AnimatedContainer(
          duration: _isRightDragging ? Duration.zero : widget.rightAnimationDuration,
          curve: widget.rightAnimationCurve,
          width: rightLayoutWidth,
          child: widget.rightBuilder(rightLayoutWidth),
        ),
      ],
    );
  }
}

class _ResizeHandle extends StatelessWidget {
  final double hitWidth;
  final double lineWidth;
  final void Function(double globalDx) onDragStart;
  final void Function(double globalDx) onDragUpdate;
  final VoidCallback onDragEnd;

  const _ResizeHandle({
    required this.hitWidth,
    required this.lineWidth,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = Theme.of(context).dividerColor;
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragStart: (d) => onDragStart(d.globalPosition.dx),
        onHorizontalDragUpdate: (d) => onDragUpdate(d.globalPosition.dx),
        onHorizontalDragEnd: (_) => onDragEnd(),
        onHorizontalDragCancel: onDragEnd,
        child: SizedBox(
          width: hitWidth,
          child: Center(
            child: Container(
              width: lineWidth,
              color: lineColor,
            ),
          ),
        ),
      ),
    );
  }
}
