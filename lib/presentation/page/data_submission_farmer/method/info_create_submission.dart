import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget infoCreateSubmission(context, data) => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      decoration: const BoxDecoration(
        color: blueLight,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kelompok Tani",
            style: smallReguler.copyWith(
              fontSize: 14,
              color: light,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data.grupFarmer,
            style: largeReguler.copyWith(color: light),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            "Keterangan",
            style: smallReguler.copyWith(
              fontSize: 14,
              color: light,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data.keterangan,
            style: largeReguler.copyWith(color: light),
          ),
        ],
      ),
    );
