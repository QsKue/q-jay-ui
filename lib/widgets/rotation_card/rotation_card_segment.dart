import 'package:flutter/material.dart';
import 'package:qjay/models/presets.dart';

class RotationCardSegment extends StatefulWidget {
  final bool isActive;
  final Selection selection;
  
  final String energiesLabel;
  final String lengthLabel;
  final String durationLabel;

  final void Function(Selection)? onPresetTap;

  const RotationCardSegment({
    super.key,
    this.isActive = false,
    required this.selection,
    required this.energiesLabel,
    required this.lengthLabel,
    required this.durationLabel,
    this.onPresetTap,
  });

  @override
  State<RotationCardSegment> createState() => _RotationCardSegmentState();
}

class _RotationCardSegmentState extends State<RotationCardSegment> {
  bool _hoveringPreset = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);
    
    final textStyle = themeData.textTheme.labelLarge?.copyWith(
      color: widget.isActive ? colorScheme.primaryContainer : _hoveringPreset ? colorScheme.primaryContainer : colorScheme.onSurface,
      fontWeight: widget.isActive ? FontWeight.bold : null,
    );

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => widget.onPresetTap?.call(widget.selection),
            child: SizedBox(
              height: 32,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _hoveringPreset = true),
                onExit: (_) => setState(() => _hoveringPreset = false),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "${widget.selection.category} - ${widget.selection.name}",
                    style: textStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 64,
          child: Text(
            widget.energiesLabel,
            style: textStyle,
            textAlign: TextAlign.center
          ),
        ),
        SizedBox(
          width: 64,
          child: Text(
            widget.lengthLabel,
            style: textStyle,
            textAlign: TextAlign.center
          ),
        ),
        SizedBox(
          width: 64,
          child: Text(
            widget.durationLabel,
            style: textStyle,
            textAlign: TextAlign.center
          ),
        ),
      ],
    );
  }
}
