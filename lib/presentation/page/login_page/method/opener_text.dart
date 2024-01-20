import 'package:flutter/material.dart';

Widget openerText(context) => Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selamat Datang Kembali",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Login ke akun anda dengan memasukan email dan kata sandi",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
// login ke akun keluar Anda dengan memasukkan email dan kata sandi
