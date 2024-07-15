import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_report_complaint/method/dropdown_history_complaint.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_report_complaint/method/table_history_report.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class WebHistoryComplaint extends StatefulWidget {
  final WidgetRef ref;
  const WebHistoryComplaint({super.key, required this.ref});

  @override
  State<WebHistoryComplaint> createState() => _WebHistoryComplaintState();
}

class _WebHistoryComplaintState extends State<WebHistoryComplaint> {
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
            "History laporan Petani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableHistoryReport(
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
