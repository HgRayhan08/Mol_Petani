import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/text_field_email_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_password_widget.dart';

Widget formLoginFarmer(
  context, {
  Key? key,
  TextEditingController? email,
  TextEditingController? password,
}) =>
    Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldEmailWidget(
            title: "Email",
            hinttext: "Example@gmail.com",
            controller: email!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextFieldPasswordWidget(
            title: "Password",
            hinttext: "Masukan Password",
            controller: password!,
            iconButton: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Lupa Kata Sandi?",
                  style: regulerReguler.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 14, 107, 183),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
