import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/widgets/data_information_widget.dart';

Widget sharingInformation(
  width,
  height,
  DistributionFertilizerFarmer data,
) =>
    Container(
      padding: EdgeInsets.all(width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
      ),
      child: Column(
        children: [
          DataInformation(
            title: "Pembagian",
            information: data.distribution,
          ),
          DataInformation(
            title: "Tahun",
            information: data.year,
          ),
          DataInformation(
            title: "Tanggal Pembagian",
            information: data.distribusiDate,
          ),
          DataInformation(
            title: "Penerimaan Urea",
            information: data.ureaDistribution.toString(),
          ),
          DataInformation(
            title: "Penerimaan Poska",
            information: data.poskaDistribution.toString(),
          ),
        ],
      ),
    );
