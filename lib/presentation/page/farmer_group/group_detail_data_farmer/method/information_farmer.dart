import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget informationDetailFarmer(UserFarmer user, width, height) => Container(
      padding: EdgeInsets.all(width * 0.03),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CardInformationWidget(
            title: "Alamat",
            information: user.alamat,
          ),
          CardInformationWidget(
            title: "Email",
            information: user.email,
          ),
          CardInformationWidget(
            title: "Nomor Nik",
            information: user.nik,
          ),
          CardInformationWidget(
            title: "Nomor Induk Keluarga",
            information: user.nik,
          ),
          CardInformationWidget(
            title: "Jenis Kelamin",
            information: user.jenisKelamin,
          ),
          CardInformationWidget(
            title: "Luas Lahan",
            information: user.luasLahan,
          ),
        ],
      ),
    );
