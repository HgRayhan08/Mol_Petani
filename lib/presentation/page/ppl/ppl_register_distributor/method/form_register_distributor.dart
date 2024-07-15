import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

Widget formRegisterDistributor(context,
        {Function()? addList,
        TextEditingController? emailcontroler,
        TextEditingController? passwordcontroler,
        TextEditingController? namecontroler,
        TextEditingController? subdistrikControler,
        TextEditingController? cangkupanControler,
        TextEditingController? tokoController,
        TextEditingController? nikControler,
        TextEditingController? handphoneConntroler}) =>
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
        TextFieldCustom(
          title: "Password",
          hinttext: 'Enter Your Password',
          controller: passwordcontroler!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        TextFieldCustom(
          title: "Tokko",
          hinttext: 'Enter Your Toko Name',
          controller: tokoController!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        TextFieldCustom(
          title: "Nomor Induk Keluarga",
          hinttext: 'Enter Your Nik',
          controller: nikControler!,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        TextFieldCustom(
          title: "Nomor Handphone",
          hinttext: 'Enter Your Phone Number',
          controller: handphoneConntroler!,
        ),
        TextFieldCustom(
          title: "Kecamatan",
          hinttext: 'Kecamatan',
          controller: subdistrikControler!,
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
              hinttext: "Cangkupan",
              controller: cangkupanControler!,
              title: "Cangkupan",
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
