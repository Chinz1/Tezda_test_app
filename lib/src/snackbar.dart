import 'package:flutter/material.dart';
import 'package:tezda_app/utils/config/colour_config.dart';

class SnackBarController {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String title, String msg, Color color) {
    final snackBar = SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(msg),
        ],
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 4),
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

void successSnackbar(String msg, [String title = 'Success']) {
  SnackBarController.showSnackBar(title, msg, ColourConfig.defaultAppColour);
}

void failedSnackbar(String msg, [String title = 'Failed']) {
  SnackBarController.showSnackBar(title, msg, ColourConfig.redColour);
}
