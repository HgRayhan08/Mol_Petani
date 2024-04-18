import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget information(
  width,
  height, {
  String? poska,
  String? urea,
  String? title,
  Function()? onPressed,
}) =>
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toString(),
              style: regulerReguler,
            ),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.05, horizontal: width * 0.03),
              width: width * 0.44,
              decoration: BoxDecoration(
                color: blueLight,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                border: Border.all(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengajuan Pupuk Urea",
                    style: regulerReguler.copyWith(fontSize: 13),
                  ),
                  Text(
                    "${urea} Kg",
                    style: extraLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.05, horizontal: width * 0.03),
              width: width * 0.44,
              decoration: BoxDecoration(
                color: blueLight,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                border: Border.all(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengajuan Pupuk Poska",
                    style: regulerReguler.copyWith(fontSize: 13),
                  ),
                  Text(
                    "${poska} Kg",
                    style: extraLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
