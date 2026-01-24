import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';

import 'search_mobile.dart';
import 'search_desktop.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return SearchDesktop();
    }
      
    return SearchMobile();
  }
}