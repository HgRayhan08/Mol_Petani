import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/widgets/data_information_widget.dart';

Widget acceptedInformation(
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
            title: "Nama Penerima",
            information: data.farmerName,
          ),
          DataInformation(
            title: "Tanggal Penerimaan",
            information: data.pickupDate,
          ),
          DataInformation(
            title: "Penerimaan Urea",
            information: data.ureaPickup.toString(),
          ),
          DataInformation(
            title: "Penerimaan Poska",
            information: data.poskaPickup.toString(),
          ),
        ],
      ),
    );
