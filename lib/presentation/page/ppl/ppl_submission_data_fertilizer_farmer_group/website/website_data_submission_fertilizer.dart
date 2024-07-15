import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/method/table_submission_farmer_group.dart';

class WebsiteDataSubmissionFertilizer extends StatefulWidget {
  final WidgetRef ref;
  const WebsiteDataSubmissionFertilizer({super.key, required this.ref});

  @override
  State<WebsiteDataSubmissionFertilizer> createState() =>
      _WebsiteDataSubmissionFertilizerState();
}

class _WebsiteDataSubmissionFertilizerState
    extends State<WebsiteDataSubmissionFertilizer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      child: Column(
        children: [
          Text(
            "Data Pengajuan Kelompok Tani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableSubmissionFarmerGroup(
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
