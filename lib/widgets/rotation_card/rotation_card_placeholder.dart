import 'package:flutter/material.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class RotationCardPlaceholder extends StatefulWidget {
  const RotationCardPlaceholder({super.key});

  @override
  State<RotationCardPlaceholder> createState() => _RotationCardPlaceholderState();
}

class _RotationCardPlaceholderState extends State<RotationCardPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = ColorScheme.of(context);

    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: Shimmer(
          color: colorScheme.surfaceBright,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              collapsedBackgroundColor: colorScheme.surfaceContainer,
              title: SizedBox(),
              controlAffinity: ListTileControlAffinity.leading,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
