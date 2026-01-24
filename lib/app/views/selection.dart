import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qjay/app/store/app_store.dart';

import 'package:qjay/app/store/page_selection_store.dart';
import 'package:qjay/app/theme/app_context.dart';

import 'selection_desktop.dart';
import 'selection_mobile.dart';

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
    return ChangeNotifierProvider<SelectionPageStore>(
      create: (context) => SelectionPageStore(context.read<AppStore>().transport)..load(id, energies),
      builder: (context, _) {
        if (context.isDesktopDevice) {
          return SelectionDesktop();
        }
        
        return SelectionMobile();
      }
    );
  }
}