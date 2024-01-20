import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formLogin(
  context, {
  TextEditingController? email,
  TextEditingController? password,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Email"),
          TextFieldCustom(
            hinttext: "Example@gmail.com",
            controller: email!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text("Password"),
          TextFieldCustom(
            hinttext: "Masukan Password",
            controller: password!,
            iconButton: true,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: const Text("Lupa Kata Sandi?"),
            ),
          ),
        ],
      ),
    );
