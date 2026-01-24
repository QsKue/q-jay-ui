import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qjay/app/navigator.dart';

import 'package:qjay/app/store/navigation_store.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int index;

  const AppBottomNavigationBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex:index,
      onTap: (value) {
        switch (value) {
          case 0:
            context.read<NavigationStore>().gotoPage(context, Routes.home);
            break;
          case 1:
            context.read<NavigationStore>().gotoPage(context, Routes.pinned);
            break;
          case 2:
            context.read<NavigationStore>().gotoPage(context, Routes.search);
            break;
          default:
            context.read<NavigationStore>().gotoPage(context, Routes.settings);
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.library_music_rounded), label: "Library"),
        BottomNavigationBarItem(icon: Icon(Icons.featured_play_list_outlined), label: "Pinned"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]
    );
  }
}