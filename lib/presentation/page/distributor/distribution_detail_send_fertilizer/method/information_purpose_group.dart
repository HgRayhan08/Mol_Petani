import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget informationPurposeGroup(SubmissionKuotaFertilizer data, width, height) =>
    Container(
      width: width,
      margin: defaultTargetPlatform == TargetPlatform.iOS
          ? EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: height * 0.02)
          : EdgeInsets.all(0),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: blueLight,
        borderRadius:defaultTargetPlatform == TargetPlatform.iOS ?BorderRadius.all(Radius.circular(20)) :BorderRadius.only(
          bottomLeft: Radius.circular(width * 0.05),
          bottomRight: Radius.circular(width * 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.nameGroupFarmer,
            style: extraLarge.copyWith(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.white),
              Text(
                data.leaderName,
                style: largeReguler.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    Text(
                      data.year,
                      style: largeReguler.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Tahun Pengajuan",
                  style: regulerReguler.copyWith(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
