import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/card_sub_menu.dart';

Widget subMenuGrupFarmer(context, ref) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardSubMenu(
          image: "assets/farmer.png",
          title: "Data Petani",
          onTap: () {},
        ),
        CardSubMenu(
          image: "assets/data_grup_farmers.png",
          title: "Data Kelompok Tani",
          onTap: () {},
        ),
        CardSubMenu(
          image: "assets/maps.png",
          title: "Lokasi Sawah",
          onTap: () {},
        ),
      ],
    );
