import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_detail_pest_report/method/information_pest_report.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';

class GroupDetailPestReportPage extends ConsumerWidget {
  final PestReport data;
  const GroupDetailPestReportPage(this.data, {super.key});

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
          content: data.nameFarmerGroup,
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
          Text("Detail", style: regulerReguler),
          informationPestReport(data, width),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
