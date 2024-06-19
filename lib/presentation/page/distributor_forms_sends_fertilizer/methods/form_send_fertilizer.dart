import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formSendFertilizer(
  width,
  height, {
  TextEditingController? name,
  TextEditingController? year,
  TextEditingController? send,
  TextEditingController? urea,
  TextEditingController? poska,
}) =>
    Column(
      children: [
        TextFieldCustom(
          hinttext: "name",
          controller: name!,
          title: "Name Distributor",
        ),
        SizedBox(
          height: height * 0.02,
        ),
        TextFieldCustom(
          hinttext: "Tahun",
          controller: year!,
          title: "Pengajuan Tahun",
        ),
        SizedBox(
          height: height * 0.02,
        ),
        TextFieldCustom(
          hinttext: "Pengiriman",
          controller: send!,
          title: "Pengiriman",
        ),
        SizedBox(
          height: height * 0.02,
        ),
        TextFieldCustom(
          hinttext: "Jumlah Urea",
          controller: urea!,
          title: "Pengiriman Urea",
        ),
        SizedBox(
          height: height * 0.02,
        ),
        TextFieldCustom(
          hinttext: "Jumlah Poska",
          controller: poska!,
          title: "Pengiriman Poska",
        ),
      ],
    );
