import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget informationReporter(PestReport data, width) => Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CardInformationWidget(title: "Nama", information: data.name),
          CardInformationWidget(
            title: "Pelaporan",
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
                Text(data.detailReporting),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
