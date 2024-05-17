import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget openerPetugas({required String title}) => Column(
      children: [
        Text(
          "Login to your Account",
          style: extraLarge.copyWith(color: dark, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: largeReguler.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
