import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formRegistrasi({TextEditingController? controler}) => Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldCustom(
            title: "Email",
            hinttext: 'Email',
            controller: controler!,
          ),
          TextFieldCustom(
            title: "Password",
            hinttext: 'password',
            controller: controler!,
          ),
          TextFieldCustom(
            title: "Nama",
            hinttext: 'Nama',
            controller: controler!,
          ),
          TextFieldCustom(
            title: "Kelompok Tani",
            hinttext: 'Kelompok Tani',
            controller: controler!,
          ),
          TextFieldCustom(
            title: "Desa",
            hinttext: 'Desa',
            controller: controler!,
          ),
        ],
      ),
    );
