import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

extension BuildContextExtension on BuildContext {
  void buildShowDialog({
    Function()? onTapCancel,
    required String berhasil,
    required Function() onTapSucces,
    required String judul,
    required String keterangan,
  }) {
    showPlatformDialog(
      context: this,
      builder: (context) => BasicDialogAlert(
        title: Text(
          judul,
          style: regulerReguler,
        ),
        content: Text(
          keterangan,
          style: regulerReguler,
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text(
              "Batal",
              style: regulerReguler,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          BasicDialogAction(
              title: Text(
                berhasil,
                style: regulerReguler,
              ),
              onPressed: onTapSucces),
        ],
      ),
    );
  }
}
