import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/views/selection_view.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';

import 'selection_compact.dart';

class SelectionPage extends StatelessWidget {
  final String id;
  final List<int>? energies;

  const SelectionPage({
    super.key,
    required this.id,
    this.energies,
  });

  @override
  Widget build(BuildContext context) {
    if (context.screenSize == ScreenSize.compact) {
      return const SelectionCompact();
    }

    if (context.screenSize == ScreenSize.medium) {
      return const SelectionCompact();
    }
    
    return AppShell(
      navIcon: QJay.qs_logo,
      body: ChangeNotifierProvider<SelectionPageStore>(
        create: (context) => SelectionPageStore(context.read<AppStore>().transport)..load(id, energies),
        builder: (context, _) {
          final selection = context.select<SelectionPageStore, Selection?>((store) => store.selection);
          
          if (selection == null) {
            return Center(child: CircularProgressIndicator());
          }

          return SelectionView(selection: selection, sortMode: SongSortMode.titleAscending);
        }
      ),
      navigationIndex: 0,
    );
  }
}