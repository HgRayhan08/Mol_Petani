import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/method/web_table_distribution_fertilizer.dart';

class WebDetailDistribution extends StatelessWidget {
  final WidgetRef ref;
  final DistributionFertilizerFarmer data;
  const WebDetailDistribution(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text(
          " Detail Data Penerimaan Pupuk",
          style: extraLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.03),
        webTableDistributionFertilizer(width, height, data: data),
      ],
    );
  }
}
