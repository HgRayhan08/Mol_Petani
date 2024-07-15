import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget webDetailInformation(DistributionFertilizerFarmer data, width, height) =>
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
                  "Pembagian",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.distribution}",
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
                  "Tanggal pembagian",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.distribusiDate}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Nama Petani",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.farmerName}",
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
                  "Jumlah Poska diterima",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.poskaDistribution}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Jumlah Urea Diterima",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.ureaDistribution}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "informasi",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.information == 'Distribution' ? 'belum diambil' : 'diambil'}",
                    style: regulerReguler,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
