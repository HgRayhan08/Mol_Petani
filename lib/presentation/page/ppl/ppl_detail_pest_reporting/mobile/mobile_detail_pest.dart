import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_pest_reporting/method/information_reporter.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class MobileDetailPest extends StatelessWidget {
  final WidgetRef ref;
  final PestReport data;
  const MobileDetailPest({super.key, required this.ref, required this.data});

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
        Text("Detail", style: regulerReguler),
        informationReporter(data, width),
        SizedBox(height: height * 0.02),
        Text(
          "Lokasi Lahan Petani :",
          style: regulerReguler,
        ),
        SizedBox(height: height * 0.01),
        MapsWidget(
          idUserFarmer: data.idUserFarmer,
          width: width * 0.75,
          isDelete: true,
        ),
        SizedBox(height: height * 0.08),
        data.information == "Pengajuan"
            ? ButtonSubmissionWidget(
                title: "Laporan Diterima",
                onTap: () {
                  ref
                      .read(reportProviderProvider.notifier)
                      .updateStatusPest(idDocument: data.idDocument!);
                  ref.read(routerProvider).pop();
                })
            : Container(),
      ],
    );
  }
}
