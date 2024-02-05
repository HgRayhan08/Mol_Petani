import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formRegisterGrup(
  mediaQueryHeight, {
  TextEditingController? emailcontroler,
  TextEditingController? passwordcontroler,
  TextEditingController? namecontroler,
  TextEditingController? grupcontroler,
  TextEditingController? vilagecontroler,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldCustom(
          title: "Email",
          hinttext: 'Email',
          controller: emailcontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Password",
          hinttext: 'password',
          controller: passwordcontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Nama",
          hinttext: 'Nama',
          controller: namecontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Kelompok Tani",
          hinttext: 'Kelompok Tani',
          controller: grupcontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Desa",
          hinttext: 'Desa',
          controller: vilagecontroler!,
        ),
      ],
    );
