import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/widgets/card_login_with.dart';

Widget loginWith() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardLoginWith(
            content: const Column(
              children: [
                Text(
                  "Penyuluh Pertanian",
                  style: TextStyle(fontSize: 11),
                ),
                Text(
                  "Lapangan",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            onTap: () {}),
        CardLoginWith(
            content: const Text(
              "Distributor Pupuk",
              style: TextStyle(fontSize: 11),
            ),
            onTap: () {}),
        CardLoginWith(
          content: const Column(
            children: [
              Text(
                "Ketua Kelompok",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                "Tani",
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
          onTap: () {},
        ),
      ],
    );
