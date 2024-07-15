import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_addintial.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_purpose_group.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/web_information.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/web_information_accepted.dart';

class WebDetailSendFertilizer extends StatelessWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  const WebDetailSendFertilizer(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text(
          "Detail Pengiriman pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        // informationPurposeGroup(data, width, height),
        SizedBox(
          height: height * 0.03,
        ),
        webInformation(width: width, height: height, user: data),
        data.information == "Selesai"
            ? webInformationAccepted(width: width, height: height, user: data)
            : Container(),
      ],
    );
  }
}
