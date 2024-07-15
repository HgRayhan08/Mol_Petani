import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_accepted_fertilizer/method/table_accepted_fertilizer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_accepted_kuota_fertilizer/method/table_accepted_kuota.dart';

class WebAcceptedFertilizer extends StatelessWidget {
  final WidgetRef ref;
  const WebAcceptedFertilizer({super.key, required this.ref});

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
          Text(
            "Data Pengiriman",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableAcceptedFertilizer(
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
