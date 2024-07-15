import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_report/method/web_information.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/method/web_information_complaint.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class WebDetailReport extends StatelessWidget {
  final Report data;
  final WidgetRef ref;
  const WebDetailReport({super.key, required this.data, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.03,
        ),
        children: [
          Text(
            "Detail Laporan Petani",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.05),
          webInformationReport(width: width, height: height, data: data),
        ],
      ),
    );
  }
}
