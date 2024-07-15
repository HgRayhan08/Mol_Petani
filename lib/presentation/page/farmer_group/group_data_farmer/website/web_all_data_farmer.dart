import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_sends_fertilizer/method/table_sends_fertilizer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/method/table_data_farmer.dart';

class WebAllDataFarmer extends StatefulWidget {
  final WidgetRef ref;
  const WebAllDataFarmer({super.key, required this.ref});

  @override
  State<WebAllDataFarmer> createState() => _WebAllDataFarmerState();
}

class _WebAllDataFarmerState extends State<WebAllDataFarmer> {
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
            child: TableDataFarmer(
              ref: widget.ref,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
