import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/widgets/data_information_widget.dart';

Widget accepetedInformation(
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
            title: "Nama Penerima",
            information: data.nameAcceptGroupFarmer,
          ),
          DataInformation(
            title: "Tanggal Penerimaan",
            information: data.acceptDate,
          ),
          DataInformation(
            title: "Jumlah Penerimaan Urea",
            information: "${data.acceptUrea.toString()} kg",
          ),
          DataInformation(
            title: "Jumlah Pennerimaan NPK",
            information: "${data.acceptPoska.toString()} kg",
          ),
        ],
      ),
    );
