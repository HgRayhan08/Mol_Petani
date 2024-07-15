import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/method/web_information_complaint.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class WebComplaint extends StatelessWidget {
  final Report data;
  final WidgetRef ref;
  const WebComplaint({super.key, required this.data, required this.ref});

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
          webInformationComplaint(width: width, height: height, data: data),
          SizedBox(height: height * 0.02),
          SizedBox(height: height * 0.02),
          data.information == "Submission"
              ? ButtonSubmissionWidget(
                  title: "Laporan Diterima",
                  onTap: () {
                    ref
                        .read(reportProviderProvider.notifier)
                        .updateStatusComplaint(idDocument: data.idDocument!);
                  })
              : Container(),
        ],
      ),
    );
  }
}
