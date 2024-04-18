import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget kuotaInformationGroup(width, height,
        {SubmissionKuotaFertilizer? data}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.03),
          width: width * 0.44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pengajuan Pupuk Urea",
                style: regulerReguler.copyWith(fontSize: 13),
              ),
              Text(
                "${data!.ureaSubmission.toString()} Kg",
                style: extraLarge.copyWith(
                  color: dark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.03),
          width: width * 0.44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pengajuan Pupuk Poska",
                style: regulerReguler.copyWith(fontSize: 13),
              ),
              Text(
                "${data.poskaSubmission.toString()} Kg",
                style: extraLarge.copyWith(
                  color: dark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
