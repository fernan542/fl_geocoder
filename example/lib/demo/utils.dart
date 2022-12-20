import 'package:flutter/material.dart';

/// For showing snackbars.
final globalScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// The values that will be used to choose between different
/// style of snackbar.
enum SnackBarType { error, information, success }

/// Shows a snackbar.
void showSnackBarColored(
  String message,
  SnackBarType snackBarType,
) {
  Color color;
  if (snackBarType == SnackBarType.success) {
    color = Colors.green;
  } else if (snackBarType == SnackBarType.information) {
    color = Colors.blue;
  } else {
    color = Colors.red;
  }

  globalScaffoldMessengerKey.currentState
    ?..clearSnackBars()
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: color,
        padding: const EdgeInsets.all(16),
        content: Text(message),
      ),
    );
}
