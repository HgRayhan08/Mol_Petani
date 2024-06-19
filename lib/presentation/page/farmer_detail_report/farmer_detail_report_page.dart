import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_detail_report/method/information_report.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class FarmerDetailReportPage extends ConsumerWidget {
  final Report data;
  const FarmerDetailReportPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          width,
          height * 0.3 -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
        ),
        child: AppbarCustomWidget(
          height: height,
          width: width,
          title: "detail Pelaporan",
          content: data.groupFarmer,
          subContext: Text(
            " Keterangan : ${data.information}",
            style: regulerReguler.copyWith(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
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
