import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor_detail_history_submission_kuota/method/detail_information.dart';
import 'package:mol_petani/presentation/page/distributor_detail_history_submission_kuota/method/detail_information_send.dart';
import 'package:mol_petani/presentation/page/distributor_detail_history_submission_kuota/method/detail_kuota_information.dart';

class DistributorDetailHistoryKuotaPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const DistributorDetailHistoryKuotaPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail History",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          Text(
            "Pengajuan Pupuk Distributor",
            style: regulerReguler,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          detailKuotaInformation(
            width,
            height,
            data: data,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            "Keterangan",
            style: regulerReguler,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          detailInformation(
            width,
            height,
            data: data,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text("Information Pengiriman", style: regulerReguler),
          informationDetailSend(width, height, data: data),
        ],
      ),
    );
  }
}
