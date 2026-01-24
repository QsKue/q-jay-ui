import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' show openAppSettings;
import 'package:provider/provider.dart';
import 'package:qjay/app/store/app_store.dart';

import 'package:qjay/assets/q_jay_icons.dart';
import 'package:qjay/transport/transport.dart';
import 'package:qjay/transport/transport_events.dart';
import 'package:qjay/widgets/button/back_button.dart';
import 'package:qjay/widgets/errors/alert_dialog.dart';

enum ConnectionStatus {
  appError,
  scanning,
  deviceFound,
  noDeviceFound,
  connecting,
  permissionsDenied,
  unsupported,
  disabled,
  pair,
  rescan,
  error,
  connected,
  forced;

  bool get isLoading
    => switch (this) {
      ConnectionStatus.scanning => true,
      ConnectionStatus.connecting => true,
      _ => false,
    };

  String? get title
    => switch (this) {
      ConnectionStatus.appError => "An error has occured...",
      ConnectionStatus.scanning => "Scanning for nearby devices...",
      ConnectionStatus.deviceFound || ConnectionStatus.connecting => "Connecting to remote device...",
      ConnectionStatus.noDeviceFound => "No remote devices found...",
      ConnectionStatus.connected => "Connection successful",
      ConnectionStatus.permissionsDenied => "Bluetooth permission denied",
      ConnectionStatus.disabled => "Bluetooth is disabled",
      ConnectionStatus.error => "Failed to connect, try again...",
      ConnectionStatus.unsupported => "Your device does not support Bluetooth",
      _ => null
    };

  (String, Function())? action(BuildContext context, Transport transport)
    => switch (this) {
      ConnectionStatus.appError
        => ("Reconnect", () => transport.scan()),
      ConnectionStatus.noDeviceFound || ConnectionStatus.disabled || ConnectionStatus.error
        => ("Retry", () => transport.scan()),
      ConnectionStatus.permissionsDenied
        => ("Open Settings", () => openAppSettings()),
      _ => null,
    };

    (String, Function())? secondAction(BuildContext context, Transport transport)
      => switch (this) {
        ConnectionStatus.permissionsDenied => ("Retry", () => transport.scan()),
        _ => null,
      };
}

class ConnectMobile extends StatefulWidget {
  final Transport transport;
  final ConnectionStatus? status;

  const ConnectMobile({
    super.key,
    required this.transport,
    required this.status,
  });

  @override
  State<ConnectMobile> createState() => _ConnectMobileState();
}

class _ConnectMobileState extends State<ConnectMobile> {
  late ConnectionStatus _status = widget.status ?? ConnectionStatus.scanning;

  StreamSubscription<ConnectionEvent>? _connectionStream;
  StreamSubscription<TransportEvent>? _transportStream;

   void _onTransportEvent(TransportEvent event) {
    switch (event) {
      case SwitchToMockMode():
        showAlertDialogYesNo(
          context: context,
          title: "Warning",
          message: "Are you sure you want to switch to mock mode?",
          action: () => context.read<AppStore>().switchToMockMode()
        );
      default:
        break;
    }
  }

  void _onConnectionEvent(ConnectionEvent event) {
    switch (event) {
      case ConnectionScanningEvent():
        setState(() => _status = ConnectionStatus.scanning);
        break;
      case ConnectionFoundEvent():
        setState(() => _status = ConnectionStatus.deviceFound);
        break;
      case ConnectionConnectingEvent():
        setState(() => _status = ConnectionStatus.connecting);
        break;
      case ConnectionNotFoundEvent():
        setState(() => _status = ConnectionStatus.noDeviceFound);
        break;
      case ConnectionEstablishedEvent():
        setState(() => _status = ConnectionStatus.connected);
        Future.delayed(Duration(milliseconds: 200)).then((_) {
          if (mounted) {
            context.read<AppStore>().reloadApp();
          }
        });
        break;
      case ConnectionRetryEvent():
      case ConnectionFailedEvent():
      case ConnectionDisconnectedEvent():
        setState(() => _status = ConnectionStatus.error);
        break;
      case ConnectionDisabledEvent():
        setState(() => _status = ConnectionStatus.disabled);
        break;
      case ConnectionUnsupportedEvent():
        setState(() => _status = ConnectionStatus.unsupported);
        break;
      case ConnectionUnauthorizedEvent():
        setState(() => _status = ConnectionStatus.permissionsDenied);
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    _transportStream = widget.transport.eventStream.listen(_onTransportEvent);
    _connectionStream = widget.transport.connectionStream.listen(_onConnectionEvent);
    widget.transport.scan();
  }

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final isLoading = _status.isLoading;
    final title = _status.title;
    final action = _status.action(context, widget.transport);
    final secondAction = _status.secondAction(context, widget.transport);

    return Scaffold(
      appBar: AppBar(
        leading: NavigationBackButton(icon: QJay.qs_logo, iconAlwaysVisible: true),
        titleSpacing: 0,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text("Connect", style: themeData.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
    
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null)
                Text(
                  title,
                  textAlign: TextAlign.center,
                  
                  style: themeData.textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    height: 2,
                  ),
                ),
                              
              if (action != null) ...[
                SizedBox(height: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: colorScheme.primaryContainer,
                    foregroundColor: colorScheme.onPrimaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: action.$2,
                  child: Text(action.$1, style: themeData.textTheme.headlineMedium),
                ),

                if (secondAction != null) ...[
                  SizedBox(height: 32),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: colorScheme.secondaryContainer,
                      foregroundColor: colorScheme.onSecondaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: secondAction.$2,
                    child: Text(secondAction.$1, style: themeData.textTheme.headlineMedium),
                  ),
                ]
              ],
                              
              if (isLoading) ...[
                SizedBox(height: 64),
                Center(child: CircularProgressIndicator()),
              ],
            ]
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _transportStream?.cancel();
    _connectionStream?.cancel();
    super.dispose();
  }
}