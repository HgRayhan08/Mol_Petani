import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void buildShowDialog(
      {required Function() onTapCancel, required Function() onTapSucces}) {
    showDialog(
      context: this,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Apakah kamu yakin?'),
        actions: <Widget>[
          TextButton(
            onPressed: onTapCancel,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onTapSucces,
            child: const Text('Log out'),
          ),
        ],
      ),
      // child: const Text('Show Dialog'),
    );
  }
}
