import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget reportInformation(Report data, width) => Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CardInformationWidget(
            title: "Nama Petani",
            information: data.nameFarmer,
          ),
          CardInformationWidget(
            title: "Judul Laporan",
            information: data.reporting,
          ),
          SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detil Pelaporan : ",
                  style: regulerReguler,
                ),
                Text(data.reportingDetail),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
