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
              image: "assets/registrasi_distributor.png",
              title: "Registrasi Distributor",
              onTap: () {
                ref.read(routerProvider).pushNamed("regis-distributor");
              },
            ),
            CardSubMenu(
              image: "assets/registrasi_kelompoktani.png",
              title: "Registrasi Kelompok Tani",
              onTap: () {
                ref.read(routerProvider).pushNamed("regis-kelompok");
              },
            ),
            CardSubMenu(
              image: "assets/data_pengajuan_kelompok.png",
              title: "Pengajuan pupuk Kelompok tani",
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
              image: "assets/data_pengajuan_dis.png",
              title: "Pengajuan Pupuk Distributor",
              onTap: () {},
            ),
            CardSubMenu(
              image: "assets/pengajuan_kedistributor.png",
              title: "Data Pengajuan ke Distributor",
              onTap: () {},
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Kelompok Tani",
              onTap: () {},
            ),
            // CardSubMenu(),
          ],
        ),
      ],
    );
