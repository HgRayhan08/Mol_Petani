import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/method/table_distribution_fertilizer_farmer.dart';

class WebDistributionFertilizerFarmer extends StatelessWidget {
  final WidgetRef ref;
  const WebDistributionFertilizerFarmer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Data Perolehan Pupuk Petani",
                style: extraLarge.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableDistributionFertilizerFarmer(
              ref: ref,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
