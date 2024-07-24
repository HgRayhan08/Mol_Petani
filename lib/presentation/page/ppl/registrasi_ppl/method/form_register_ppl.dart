import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';
import 'package:mol_petani/presentation/widgets/text_field_password_widget.dart';

Widget formRegisterPpl(
  context, {
  Function()? addList,
  TextEditingController? emailcontroler,
  TextEditingController? passwordcontroler,
  TextEditingController? namecontroler,
  TextEditingController? kecamatanController,
  TextEditingController? cangkupanControler,
  TextEditingController? nikController,
}) =>
    Column(
      children: [
        TextFieldCustom(
          title: "Username",
          hinttext: 'Enter Your Username',
          controller: namecontroler!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        TextFieldCustom(
          title: "Email",
          hinttext: 'Enter Your Emmail',
          controller: emailcontroler!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        TextFieldPasswordWidget(
          title: "Password",
          hinttext: 'Enter Your Password',
          controller: passwordcontroler!,
          iconButton: true,
        ),
        TextFieldCustom(
          title: "Nik",
          hinttext: 'Nomor Induk Keluarga',
          controller: nikController!,
        ),
        TextFieldCustom(
          title: "Kecamatan",
          hinttext: 'kecamatan',
          controller: kecamatanController!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldCustom(
              width: MediaQuery.of(context).size.width * 0.5,
              hinttext: "Pengawasan",
              controller: cangkupanControler!,
              title: "Pengawasan",
            ),
            ElevatedButton(
              onPressed: addList,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 50),
                padding: const EdgeInsets.symmetric(vertical: 10),
                backgroundColor: const Color(0xff7BD3EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "add",
                style: buttonReguler.copyWith(color: light),
              ),
            ),
          ],
        ),
      ],
    );
