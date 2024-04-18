import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_sub_menu.dart';

Widget subMenuPpl(context, ref) => Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardSubMenu(
              image: "assets/registrasi_distributor.png",
              title: "Data Distributor",
              onTap: () {
                ref.read(routerProvider).goNamed("data-distributor");
              },
            ),
            CardSubMenu(
              image: "assets/data_petani.png",
              title: "Data Kelompok Tani",
              onTap: () {
                ref.read(routerProvider).goNamed("data-grup-farmer");
              },
            ),
            CardSubMenu(
              image: "assets/data_pengajuan_kelompok.png",
              title: "Pengajuan pupuk Kelompok tani",
              onTap: () {
                ref.read(routerProvider).pushNamed("all-submission-grup");
              },
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
              title: "Data Petani",
              onTap: () {
                ref.read(routerProvider).pushNamed("submission-fertilizer-ppl");
              },
            ),
            CardSubMenu(
              image: "assets/pengajuan_kedistributor.png",
              title: "Data Pengajuan ke Distributor",
              onTap: () {},
            ),
            CardSubMenu(
              image: "assets/monitor_pupuk.png",
              title: "Monitoring Pupuk Kelompok",
              onTap: () {
                ref.read(routerProvider).goNamed("monitoring-fertilizer-group");
              },
            ),
            // CardSubMenu(),
          ],
        ),
      ],
    );
