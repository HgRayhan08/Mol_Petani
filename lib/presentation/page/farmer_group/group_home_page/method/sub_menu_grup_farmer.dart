import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_sub_menu.dart';

Widget subMenuGrupFarmer(context, ref) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CardSubMenu(
          image: "assets/farmer.png",
          title: "Data Petani",
          onTap: () {
            ref.read(routerProvider).goNamed("data-farmer");
          },
        ),
        CardSubMenu(
          image: "assets/data_grup_farmers.png",
          title: "Member Kelompok Tani",
          onTap: () {
            ref.read(routerProvider).goNamed("member-farmer-group");
          },
        ),
        CardSubMenu(
          image: "assets/maps.png",
          title: "Penerimaan Pupuk",
          onTap: () {
            ref.read(routerProvider).goNamed("accepted-fertilizer-grup");
          },
        ),
        CardSubMenu(
          image: "assets/maps.png",
          title: "Laporan Hama Penyakit",
          onTap: () {
            ref.read(routerProvider).goNamed("report-hama");
          },
        ),
      ],
    );
