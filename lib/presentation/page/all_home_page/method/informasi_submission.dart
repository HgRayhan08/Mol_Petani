import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

Widget informationOrderFertilizer(
  context,
  ref,
  width,
  height, {
  required Future<List<DataSubmissionGroup?>> dataOrder,
  required Future<List<SubmissionKuotaFertilizer>> dataSend,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.4,
          height: height * 0.1,
          decoration: BoxDecoration(
            color: blueLight,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: FutureBuilder(
            future: dataOrder,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Jumlah Pengajuan",
                      style: regulerReguler.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data!.length.toString(),
                      // snapshot.data!.length.toString(),
                      style: largeReguler.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "Pengajuan Error",
                    style: largeReguler,
                  ),
                );
              }
            },
          ),
        ),
        Container(
          width: width * 0.4,
          height: height * 0.1,
          decoration: BoxDecoration(
            color: blueLight,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: FutureBuilder(
            future: dataSend,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Proses Pengiriman",
                      style: regulerReguler.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      data.length.toString(),
                      style: largeReguler.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    "Pengajuan Error",
                    style: largeReguler,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
