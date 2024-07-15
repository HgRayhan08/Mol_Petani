// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_report/method/information_report.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileDetailReport extends StatelessWidget {
  final Report data;
  final WidgetRef ref;
  const MobileDetailReport({
    Key? key,
    required this.data,
    required this.ref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "Detail Laporan :",
          style: regulerReguler,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        informationReport(data, width),
        SizedBox(height: height * 0.4),
        // data.information == "Submission"
        //     ? ButtonSubmissionWidget(
        //         title: "Laporan Diterima",
        //         onTap: () {
        //           ref
        //               .read(reportProviderProvider.notifier)
        //               .updateStatusComplaint(idDocument: data.idDocument!);
        //         })
        //     : Container(),
      ],
    );
  }
}
