import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formLoginFarmer(
  context, {
  TextEditingController? email,
  TextEditingController? password,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldCustom(
            title: "Email",
            hinttext: "Example@gmail.com",
            controller: email!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextFieldCustom(
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
