import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget textBottomPetugas({required String title}) => Column(children: [
      Text(
        "Login for",
        style: smallReguler.copyWith(fontSize: 14),
      ),
      Text(
        title,
        style: smallReguler.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ]);
