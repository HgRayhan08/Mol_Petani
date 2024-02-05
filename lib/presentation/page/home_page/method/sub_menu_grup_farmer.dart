import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/card_sub_menu.dart';

Widget subMenuGrupFarmer(context, ref) => Row(
      children: [
        CardSubMenu(
          image: "assets/farmer.png",
          title: "Data Petani",
          onTap: () {},
        ),
      ],
    );
