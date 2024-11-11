import 'package:flutter/material.dart';

class PopupManager {
  static void showCaptionSavedPopup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Caption saved to favorites!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static void showShareSuccessPopup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
        content: Text('Caption shared successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static void showErrorPopup(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}