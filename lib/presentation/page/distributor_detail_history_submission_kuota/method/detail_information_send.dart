import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget informationDetailSend(width, height,
        {SubmissionKuotaFertilizer? data}) =>
    Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengirim",
            style: regulerReguler,
          ),
          Text(
            data!.sendNameDistributor,
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Penerima Kelompok Tani",
            style: regulerReguler,
          ),
          Text(
            "Kelompok ${data.senderName}",
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Jumlah Pengiriman Urea",
            style: regulerReguler,
          ),
          Text(
            data.ureaSend.toString(),
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Jumlah Pengiriman Poska",
            style: regulerReguler,
          ),
          Text(
            data.poskasend.toString(),
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
