import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_responsive_scope.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.device == AppDevice.desktop) {
      return const _NotFound();
    }

    switch (context.layout) {
      case AppLayout.small:
        return const _NotFound();
      case AppLayout.medium:
        return const _NotFound();
      case AppLayout.large:
      case AppLayout.wide:
        return const _NotFound();
    }
  }
}

class _NotFound extends StatelessWidget {
  const _NotFound();
  @override
  Widget build(BuildContext context) => ListView(
    children: const [Text('Page not found')],
  );
}