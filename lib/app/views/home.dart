import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qjay/app/app_shell.dart';
import 'package:qjay/app/store/app_store.dart';
import 'package:qjay/app/store/page_schedule_store.dart';
import 'package:qjay/app/store/page_search_store.dart';
import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/app/views/schedule_view.dart';
import 'package:qjay/app/views/search_view.dart';
import 'package:qjay/app/views/selection_view.dart';
import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';

import 'home_compact.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _presetView(BuildContext context) {
    final presetInfo = context.select<PlayerStore, (PresetType, String)?>((store) => store.currentPreset);

    return switch(presetInfo) {
      (PresetType presetType, String id) => switch (presetType) {
        PresetType.schedule => ChangeNotifierProvider<SchedulePageStore>(
          create: (context) => SchedulePageStore(context.read<AppStore>().transport)..load(id),
          builder: (context, _) {
            final schedule = context.select<SchedulePageStore, Schedule?>((store) => store.schedule);
            
            if (schedule == null) {
              return Center(child: CircularProgressIndicator());
            }
            
            return ScheduleView(schedule: schedule);
          }
        ),
        PresetType.selection || PresetType.tools => ChangeNotifierProvider<SelectionPageStore>(
          create: (context) => SelectionPageStore(context.read<AppStore>().transport)..load(id, null),
          builder: (context, _) {
            final selection = context.select<SelectionPageStore, Selection?>((store) => store.selection);
            
            if (selection == null) {
              return Center(child: CircularProgressIndicator());
            }

            return SelectionView(selection: selection, sortMode: SongSortMode.titleAscending);
          }
        ),
        // TODO: NOT IMPLEMENTED
        PresetType.userPlayist => throw UnimplementedError(),
      },
      null => Center(child: CircularProgressIndicator()),
    };
  }

  @override
  Widget build(BuildContext context) {
    if (context.screenSize == ScreenSize.compact) {
      return const HomeCompact();
    }

    if (context.screenSize == ScreenSize.medium) {
      return const HomeCompact();
    }

    final searchQuery = context.select<SearchPageStore, String>((store) => store.currentQuery);
    
    return AppShell(
      navIcon: QJay.qs_logo,
      body: searchQuery.isNotEmpty ? SearchView(query: searchQuery) : _presetView(context),
    );
  }
}