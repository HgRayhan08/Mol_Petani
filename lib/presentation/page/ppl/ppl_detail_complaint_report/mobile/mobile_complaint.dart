import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/method/complaint_information.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileComplaint extends StatelessWidget {
  final Report data;
  final WidgetRef ref;
  const MobileComplaint({super.key, required this.data, required this.ref});

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
        reportInformation(data, width),
        SizedBox(height: height * 0.4),
        defaultTargetPlatform == TargetPlatform.iOS
            ? Container()
            : data.information == "Submission"
                ? ButtonSubmissionWidget(
                    title: "Laporan Diterima",
                    onTap: () {
                      ref
                          .read(reportProviderProvider.notifier)
                          .updateStatusComplaint(idDocument: data.idDocument!);
                      ref.read(routerProvider).pop();
                    })
                : Container(),
      ],
    );
  }
}
