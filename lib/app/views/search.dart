import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/views/search_view.dart';
import 'package:qjay/assets/q_jay_icons.dart';

import 'search_compact.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) { 
    if (context.screenSize == ScreenSize.compact) {
      return const SearchCompact();
    }

    return AppShell(
      navIcon: QJay.qs_logo,
      body: SearchView(query: context.select<SearchPageStore, String>((store) => store.currentQuery)),
      navigationIndex: 2,
    );
  }
}