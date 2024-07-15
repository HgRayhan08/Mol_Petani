import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';
import 'package:mol_petani/presentation/widgets/text_field_email_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_password_widget.dart';

Widget webFormCreateFarmerGroup(
  width,
  mediaQueryHeight, {
  Key? key,
  TextEditingController? emailcontroler,
  TextEditingController? passwordcontroler,
  TextEditingController? leadernameController,
  TextEditingController? grupcontroler,
  TextEditingController? vilagecontroler,
  TextEditingController? nikControler,
  TextEditingController? handphoneConntroler,
}) =>
    Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldEmailWidget(
            title: "Email",
            hinttext: 'Enter Your Email',
            controller: emailcontroler!,
          ),
          SizedBox(
            height: mediaQueryHeight * 0.01,
          ),
          TextFieldPasswordWidget(
            title: "Password",
            hinttext: 'Enter Your Password',
            controller: passwordcontroler!,
            iconButton: true,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.26,
                title: "Ketua Kelompok Tani",
                hinttext: 'Enter Your Username',
                controller: leadernameController!,
              ),
              TextFieldCustom(
                width: width * 0.26,
                title: "Farmer Grup",
                hinttext: ' Enter Your Farmer Grup',
                controller: grupcontroler!,
              ),
            ],
          ),
          SizedBox(
            height: mediaQueryHeight * 0.01,
          ),
          SizedBox(
            height: mediaQueryHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.26,
                title: "Nomor Induk Keluarga",
                hinttext: 'Enter Your Password',
                controller: nikControler!,
              ),
              TextFieldCustom(
                width: width * 0.26,
                title: "Nomor Handphone",
                hinttext: 'Enter Your Phone Number',
                controller: handphoneConntroler!,
              ),
            ],
          ),
        ],
      ),
    );
