import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_pest_reporting/method/detail_pest.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class WebDetailPest extends StatelessWidget {
  final WidgetRef ref;
  final PestReport data;
  const WebDetailPest({super.key, required this.data, required this.ref});

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
            "Detail Laporan Hama",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          detailPest(width: width, height: height, data: data),
          SizedBox(height: height * 0.02),
          MapsWidget(
            idUserFarmer: data.idUserFarmer,
            width: width * 0.3,
            isDelete: true,
          ),
          SizedBox(height: height * 0.02),
          data.information == "Pengajuan"
              ? ButtonSubmissionWidget(
                  title: "Laporan Diterima",
                  onTap: () {
                    ref
                        .read(reportProviderProvider.notifier)
                        .updateStatusPest(idDocument: data.idDocument!);
                  })
              : Container(),
        ],
      ),
    );
  }
}
