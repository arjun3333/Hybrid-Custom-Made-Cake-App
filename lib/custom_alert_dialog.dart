import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  final BuildContext context;
  final String title;
  final String message;
  final String okText;
  final VoidCallback onPressedOk;
  final String? cancelText;
  final VoidCallback? onPressedCancel;

  CustomAlertDialog({
    required this.context,
    required this.title,
    required this.message,
    required this.okText,
    required this.onPressedOk,
    this.cancelText,
    this.onPressedCancel,
  });

  show() {
    if (Platform.isIOS) {
      _showIosDialog();
    } else {
      _showAlertDialog();
    }
  }

  _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (onPressedCancel != null) onPressedCancel!();
            },
            child: Text(cancelText != null ? cancelText! : ""),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPressedOk();
            },
            child: Text(okText),
          ),
        ],
      ),
    );
  }

  _showIosDialog() {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(cancelText != null ? cancelText! : ""),
            onPressed: () {
              Navigator.pop(context);
              if (onPressedCancel != null) onPressedCancel!();
            },
          ),
          CupertinoDialogAction(
            child: Text(okText),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              onPressedOk();
            },
          )
        ],
      ),
    );
  }
}
