import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/back_button.dart';

class AppShell extends StatelessWidget {

  final IconData? navIcon;
  final VoidCallback? navAction;

  final Widget title;
  final Widget body;

  const AppShell({
    super.key,
    this.navIcon,
    this.navAction,
    required this.title,
    required this.body,
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(icon: navIcon, onPressed: navAction),
        titleSpacing: 0,
        title: title,
        actions: [
          
        ],
      ),
      body: body,
    );
  }
}