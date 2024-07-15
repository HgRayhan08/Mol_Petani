import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_report_complaint/mobile/mobile_history_complaint.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_report_complaint/website/web_history_complaint.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/mobile/mobile_data_submission_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplHistoryReportComplaint extends ConsumerWidget {
  const PplHistoryReportComplaint({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Laporan",
          style: largeReguler,
        ),
      ),
      body: MobileHistoryComplaint(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "History Laporan",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "History Laporan",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileHistoryComplaint(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 0.06,
        leading: TextButton(
            style: ElevatedButton.styleFrom(
              // padding: const EdgeInsets.symmetric(horizontal: 200),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            child: Text("Back", style: regulerReguler)),
      ),
      body: WebHistoryComplaint(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
