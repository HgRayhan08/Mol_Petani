import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formSubmissionFarmer(context,
        {TextEditingController? nama,
        TextEditingController? nik,
        TextEditingController? luas}) =>
    Column(
      children: [
        TextFieldCustom(
          hinttext: "Nama",
          controller: nama!,
          title: "Nama Petani",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFieldCustom(
          hinttext: "Nik",
          controller: nik!,
          title: "Nik",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFieldCustom(
          hinttext: "Luas Lahan",
          controller: luas!,
          title: "Luas Lahan Petani",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
