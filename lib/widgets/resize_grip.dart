
import 'package:flutter/material.dart';

import 'package:window_manager/window_manager.dart';

class ResizeGripBR extends StatefulWidget {
  const ResizeGripBR({super.key});

  @override
  State<ResizeGripBR> createState() => _ResizeGripBRState();
}

class _ResizeGripBRState extends State<ResizeGripBR> with WindowListener {
  bool _isMaximized = true;
  Size? _windowSize;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
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
    if (_isMaximized) return const SizedBox();

    return Positioned(
      right: 0,
      bottom: 0,
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeDownRight,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanUpdate: (details) async {
            final windowSize = _windowSize ?? MediaQuery.of(context).size;

            final updatedSize = Size(
              (windowSize.width + details.delta.dx).clamp(600, double.infinity),
              (windowSize.height + details.delta.dy).clamp(400, double.infinity),
            );

            windowManager.setSize(updatedSize);
            setState(() => _windowSize = updatedSize);
          },
          child: const SizedBox(width: 14, height: 14),
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
