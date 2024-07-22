import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget webDetailFarmer(UserFarmer user, width, height) => SizedBox(
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
                    ": ${user.nik}",
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
                  "Email",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${user.nik}"),
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
                    ": ${user.name}",
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
                  "Email",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${user.email}"),
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
                  child: Text(": ${user.luasLahan}"),
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
                  child: Text(": ${user.farmerGroup}"),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text(
                  "Jenis Kelamin",
                  style: regulerReguler,
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${user.jenisKelamin}"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
