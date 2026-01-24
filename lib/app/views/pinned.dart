import 'package:flutter/material.dart';

import 'pinned_mobile.dart';

class PinnedPage extends StatelessWidget {
  
  const PinnedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // if (context.isDesktopDevice) {
    //   return PinnedDesktop();
    // }

    return PinnedMobile();
  }
}