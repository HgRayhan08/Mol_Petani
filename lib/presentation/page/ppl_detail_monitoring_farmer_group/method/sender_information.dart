import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/widgets/data_information_widget.dart';

Widget senderInformation(
  width,
  height,
  SubmissionKuotaFertilizer data,
) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.02),
        ),
      ),
      child: Column(
        children: [
          DataInformation(
            title: "Nama Distributor",
            information: data.nameDistributor,
          ),
          DataInformation(
            title: "Tanggal Pengiriman",
            information: data.sendDate,
          ),
          DataInformation(
            title: "Jumlah Urea",
            information: "${data.sendUrea.toString()} kg",
          ),
          DataInformation(
            title: "Jumlah NPK",
            information: "${data.sendPoska.toString()} kg",
          ),
        ],
      ),
    );
