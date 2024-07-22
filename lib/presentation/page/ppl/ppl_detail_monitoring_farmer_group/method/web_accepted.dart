import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget webAccepted(
  width,
  height,
  SubmissionKuotaFertilizer data,
) =>
    Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Penerima", style: regulerReguler),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.01),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(data.nameAcceptFarmerGroup),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tanggal Penerimaan", style: regulerReguler),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.01),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(data.acceptDate),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah Penerimaan Urea", style: regulerReguler),
                Container(
                  width: width * 0.22,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(data.acceptUrea.toString()),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah Penerimaan NPK atau Poka", style: regulerReguler),
                Container(
                  width: width * 0.22,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.01),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(data.acceptPoska.toString()),
                )
              ],
            ),
          ],
        ),
        // DataInformation(
        //   title: "Nama Penerima",
        //   information: data.nameAcceptGroupFarmer,
        // ),
        // DataInformation(
        //   title: "Tanggal Penerimaan",
        //   information: data.acceptDate,
        // ),
        // DataInformation(
        //   title: "Jumlah Penerimaan Urea",
        //   information: "${data.acceptUrea.toString()} kg",
        // ),
        // DataInformation(
        //   title: "Jumlah Pennerimaan NPK",
        //   information: "${data.acceptPoska.toString()} kg",
        // ),
      ],
    );
