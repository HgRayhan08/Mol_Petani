import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/card_sub_menu.dart';

Widget subMenuPplPage(context, ref) => Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Registrasi Distributor",
              onTap: () {
                ref.read(routerProvider).goNamed("regis-distributor");
              },
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Registrasi Kelompok Tani",
              onTap: () {
                ref.read(routerProvider).goNamed("regis-kelompok");
              },
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Petani jauh ini",
              onTap: () {},
            ),
            // CardSubMenu(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Petani",
              onTap: () {},
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Petani jauh ini",
              onTap: () {},
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Petani jauh ini",
              onTap: () {},
            ),
            // CardSubMenu(),
          ],
        ),
      ],
    );
