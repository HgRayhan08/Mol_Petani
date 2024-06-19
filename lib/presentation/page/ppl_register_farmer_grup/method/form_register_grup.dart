import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formRegisterFarmerGrup(
  mediaQueryHeight, {
  TextEditingController? emailcontroler,
  TextEditingController? passwordcontroler,
  TextEditingController? namecontroler,
  TextEditingController? leadernameController,
  TextEditingController? grupcontroler,
  TextEditingController? vilagecontroler,
  TextEditingController? nikControler,
  TextEditingController? handphoneConntroler,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldCustom(
          title: "Nama Kelompok tani",
          hinttext: 'Enter Your Username',
          controller: namecontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Ketua Kelompok Tani",
          hinttext: 'Enter Your Username',
          controller: leadernameController!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Email",
          hinttext: 'Enter Your Email',
          controller: emailcontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Password",
          hinttext: 'Enter Your Password',
          controller: passwordcontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Nomor Induk Keluarga",
          hinttext: 'Enter Your Password',
          controller: nikControler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.008,
        ),
        TextFieldCustom(
          title: "Nomor Handphone",
          hinttext: 'Enter Your Phone Number',
          controller: handphoneConntroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Village",
          hinttext: 'Enter Your Village',
          controller: vilagecontroler!,
        ),
        SizedBox(
          height: mediaQueryHeight * 0.01,
        ),
        TextFieldCustom(
          title: "Farmer Grup",
          hinttext: ' Enter Your Farmer Grup',
          controller: grupcontroler!,
        ),
      ],
    );
