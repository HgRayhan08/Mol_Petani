import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_detail_information/method/information.dart';

class PplMonitoringSubmissionDistributor extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const PplMonitoringSubmissionDistributor(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Monitoring Pupuk",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(
        //     horizontal: width * 0.05, vertical: height * 0.02),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Container(
              margin: EdgeInsets.only(right: width * 0.4),
              padding: EdgeInsets.only(
                  top: width * 0.03, bottom: width * 0.03, left: width * 0.05),
              decoration: const BoxDecoration(
                color: blueLight,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Text(
                "Distributor",
                style: largeReguler.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: information(
              width,
              height,
              urea: data.ureaSubmission.toString(),
              poska: data.poskaSubmission.toString(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            margin: EdgeInsets.only(top: height * 0.05),
            height: height,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pengajuan Pupuk", style: largeReguler),
                    CircleAvatar(
                      child:
                          Text(data.submission.toString(), style: largeReguler),
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Distributor",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(data.distributorName, style: largeReguler),
                SizedBox(height: height * 0.02),
                Text(
                  "Pengirim",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(data.sendNameDistributor, style: largeReguler),
                SizedBox(height: height * 0.02),
                Text(
                  "Penerima",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(data.recipientName, style: largeReguler),
                SizedBox(height: height * 0.02),
                Text(
                  "Tanggal Pelaksana",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(data.prosesDate, style: largeReguler)
              ],
            ),
          )
        ],
      ),
    );
  }
}
