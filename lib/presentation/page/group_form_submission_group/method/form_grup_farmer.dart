import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget submissionGrupFarmer(
  context, {
  TextEditingController? tahun,
  TextEditingController? name,
  TextEditingController? grup,
  TextEditingController? village,
}) =>
    Column(
      children: [
        TextFieldCustom(
          hinttext: "Tahun Pengajuan",
          controller: tahun!,
          title: "tahun Pengajuan",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFieldCustom(
          hinttext: "Nama",
          controller: name!,
          title: "Nama Ketua Kelompok",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFieldCustom(
          hinttext: "Kelompok Tani ...",
          controller: grup!,
          title: "Kelompok Tani",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFieldCustom(
          hinttext: "Desa ...",
          controller: village!,
          title: "Desa Kelompok Tani",
        ),
      ],
    );
