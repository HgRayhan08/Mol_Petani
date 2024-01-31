import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget openerPetani(context) => Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Datang Kembali",
            style: extraLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Login ke akun anda dengan memasukan email dan kata sandi",
            style: regulerReguler,
          ),
        ],
      ),
    );
// login ke akun keluar Anda dengan memasukkan email dan kata sandi
