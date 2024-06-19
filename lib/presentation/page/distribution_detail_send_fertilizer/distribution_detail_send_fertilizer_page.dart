import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distribution_detail_send_fertilizer/method/information_addintial.dart';
import 'package:mol_petani/presentation/page/distribution_detail_send_fertilizer/method/information_purpose_group.dart';

class DistributionDetailSendFertilizerPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const DistributionDetailSendFertilizerPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pengiriman",
          style: largeReguler,
        ),
      ),
      body: ListView(
        children: [
          informationPurposeGroup(data, width, height),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: informationAddintion(data, width),
          ),
        ],
      ),
    );
  }
}
