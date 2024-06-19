import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  buildAlertInformation() {
    showDialog(
      context: this,
      builder: (BuildContext context) => const AlertDialog(
        title: Icon(Icons.check),
        content: Text('Data berhasil Disimpan'),
      ),
      // child: const Text('Show Dialog'),
    );
  }
}
