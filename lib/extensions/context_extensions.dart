import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void showErrorDialog(String message) {
    showDialog(
      context: this,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
