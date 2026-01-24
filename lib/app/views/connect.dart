import 'package:flutter/material.dart';

import 'package:qjay/app/theme/app_context.dart';
import 'package:qjay/transport/transport.dart';

import 'connect_mobile.dart';

class ConnectPage extends StatelessWidget {
  final Transport transport;
  final ConnectionStatus? status;

  const ConnectPage({
    super.key,
    required this.transport,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopDevice) {
      return ConnectMobile(transport: transport, status: status);
    }
    
    return ConnectMobile(transport: transport, status: status);
  }
}