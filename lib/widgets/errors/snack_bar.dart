import 'package:flutter/material.dart';

SnackBar detaildSnackBar(BuildContext context, String title, String message) {
  final theme = Theme.of(context);
  final colorScheme = ColorScheme.of(context);

  return SnackBar(
    backgroundColor: colorScheme.errorContainer,
    behavior: SnackBarBehavior.floating,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ],
          ),
        ),

        IconButton(
          icon: const Icon(Icons.close),
          color: Theme.of(context).colorScheme.onErrorContainer,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    ),
  );
}