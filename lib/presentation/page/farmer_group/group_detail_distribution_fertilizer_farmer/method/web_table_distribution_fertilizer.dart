import 'package:flutter/widgets.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget webTableDistributionFertilizer(width, height,
        {required DistributionFertilizerFarmer data}) =>
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
                child: Text("Nama Petani", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.farmerName}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Pengiriman", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.distribution}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Status", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.information}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Tahun", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.year}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text("", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Tanggal Pebagian", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child:
                      Text(": ${data.distribusiDate}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Jumlah Urea", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child:
                      Text(": ${data.ureaDistribution}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(
                    "",
                    style: regulerReguler,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Tanggal Diambil", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.pickupDate}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Tanaman", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.plant}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Jumlah poska (NPK) ", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.poskaDistribution}",
                      style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Text("Jumlah Urea diambil", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.ureaPickup}", style: regulerReguler),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child:
                    Text("Jumlah poska (NPK) diambil ", style: regulerReguler),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Text(": ${data.poskaPickup}", style: regulerReguler),
                ),
              ),
            ],
          ),
        ],
      ),
    );
