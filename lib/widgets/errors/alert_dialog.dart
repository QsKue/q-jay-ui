import 'package:flutter/material.dart';

bool _isDialogShowing = false;

void clearDialogs(BuildContext context) {
  if (_isDialogShowing) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  _isDialogShowing = false;
}

void _showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  String? cancelLabel,
  String? actionLabel,
  Function()? action,
  String? initialSubmitValue,
  Function(String)? onSubmit
}) {
  if (_isDialogShowing) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  _isDialogShowing = true;

  final controller = TextEditingController(text: initialSubmitValue ?? "");

  final colorScheme = ColorScheme.of(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: colorScheme.surfaceDim,
      title: Text(title, style: TextStyle(color: colorScheme.primary)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center, style: TextStyle(color: colorScheme.onSurface)),

          if (onSubmit != null) ...[
            const SizedBox(height: 12),

            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ]
        ],
      ),
      actions: [

        if (cancelLabel != null)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _isDialogShowing = false;
            },
            child: Text(cancelLabel, style: TextStyle(color: colorScheme.onSurface)),
          ),

        if (actionLabel != null)
          TextButton(
            onPressed: () {
              action?.call();
              onSubmit?.call(controller.text);

              Navigator.pop(context);
              _isDialogShowing = false;
            },
            child: Text(actionLabel, style: TextStyle(color: colorScheme.onSurface)),
          ),
      ],
    ),
  );
}

void showAlertDialogYesNo({
  required BuildContext context,
  required String title,
  required String message,
  required Function() action
})
  => _showAlertDialog(context: context, title: title, message: message, cancelLabel: "No", actionLabel: "Yes", action: action);

void showAlertDialogBlocking({
  required BuildContext context,
  required String title,
  required String message,
})
  => _showAlertDialog(context: context, title: title, message: message);

void showAlertDialogOk({
  required BuildContext context,
  required String title,
  required String message,
  Function()? action
})
  => _showAlertDialog(context: context, title: title, message: message, actionLabel: "Ok", action: action);

void showAlertDialogWithInput({
  required BuildContext context,
  required String title,
  required String message,
  String? initialValue,
  String? actionLabel,
  String? cancelLabel,
  required void Function(String value) onSubmit,
}) 
  => _showAlertDialog(context: context, title: title, message: message, cancelLabel: cancelLabel ?? "Cancel", actionLabel: actionLabel ?? "Submit", initialSubmitValue: initialValue, onSubmit: onSubmit);