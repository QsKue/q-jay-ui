import 'package:flutter/material.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/views/pinned_view.dart';
import 'package:qjay/assets/q_jay_icons.dart';

import 'pinned_compact.dart';

class PinnedPage extends StatelessWidget {
  
  const PinnedPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.screenSize == ScreenSize.compact) {
      return const PinnedMobile();
    }

    return AppShell(
      navIcon: QJay.qs_logo,
      body: PinnedView(),
      navigationIndex: 1,
    );
  }
}