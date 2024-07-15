// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_accepted_fertilizer/method/web_detail_information.dart';

class WebDetailAccepted extends StatelessWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  final WidgetRef ref;
  const WebDetailAccepted({
    Key? key,
    required this.dataFertilizer,
    required this.ref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.03),
      children: [
        Text(
          "Detail pembagian Pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        webDetailInformation(dataFertilizer, width, height),
      ],
    );
  }
}
