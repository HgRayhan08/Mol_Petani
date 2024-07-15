import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_submission_group/method/table_detail_submission.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class WebDetailSubmissionGroup extends StatefulWidget {
  final WidgetRef ref;
  final DataSubmissionGroup data;
  const WebDetailSubmissionGroup(
      {super.key, required this.data, required this.ref});

  @override
  State<WebDetailSubmissionGroup> createState() =>
      _WebDetailSubmissionGroupState();
}

class _WebDetailSubmissionGroupState extends State<WebDetailSubmissionGroup> {
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
          SizedBox(
            height: height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Penyuluh pertanian Lapangan",
                  style: regulerReguler,
                ),
                SizedBox(width: width * 0.01),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                SizedBox(width: width * 0.01),
                Text(
                  "Data Tambahan Kelompok Tani",
                  style: extraLarge.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableDetailSubmission(
              data: widget.data,
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
