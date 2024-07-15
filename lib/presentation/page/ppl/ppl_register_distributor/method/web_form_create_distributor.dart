import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';
import 'package:mol_petani/presentation/widgets/text_field_email_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_password_widget.dart';

Widget webFormCreateDsitributor(context, width, height,
        {Function()? addList,
        Key? key,
        TextEditingController? emailcontroler,
        TextEditingController? passwordcontroler,
        TextEditingController? namecontroler,
        TextEditingController? subdistrikControler,
        TextEditingController? cangkupanControler,
        TextEditingController? tokoController,
        TextEditingController? nikControler,
        TextEditingController? handphoneConntroler}) =>
    Form(
      key: key,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.26,
                title: "Username",
                hinttext: 'Enter Your Username',
                controller: namecontroler!,
              ),
              TextFieldCustom(
                width: width * 0.26,
                title: "Kecamatan",
                hinttext: 'Kecamatan',
                controller: subdistrikControler!,
              ),
            ],
          ),
          TextFieldCustom(
            width: width * 0.26,
            title: "Tokko",
            hinttext: 'Enter Your Toko Name',
            controller: tokoController!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          TextFieldEmailWidget(
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.26,
                title: "Nomor Induk Keluarga",
                hinttext: 'Enter Your Nik',
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: MediaQuery.of(context).size.width * 0.4,
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
      ),
    );
