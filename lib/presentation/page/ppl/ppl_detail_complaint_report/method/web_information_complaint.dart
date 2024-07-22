import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget webInformationComplaint({
  Report? data,
  required double width,
  required double height,
}) =>
    SizedBox(
      // width: width * 0.3,
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
                  "Nama Pelapor",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data!.nameFarmer}",
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
                  "Kelompok Tani",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.farmerGroup}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Tanggal Pelaporan",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    ": ${data.submissionDate}",
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
                  "Laporan",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.reporting}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Detail Laporan",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.detailReporting}"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
