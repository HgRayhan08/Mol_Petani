import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget informationSuppoting({
  required SupportingDataFertilizer data,
  required double width,
  required double height,
}) =>
    SizedBox(
      width: width * 0.3,
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(width * 0.06),
          1: FixedColumnWidth(width * 0.06),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Nik",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.nik}",
                    style: regulerReguler,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Petani",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.namaPetani}",
                    style: regulerReguler,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Luas Lahan",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.luasLahan}"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
