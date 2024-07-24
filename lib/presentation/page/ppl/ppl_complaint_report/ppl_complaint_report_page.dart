import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_complaint_report/mobile/mobile_complaint_report.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_complaint_report/website/web_complaint_report.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplComplaintReportPage extends ConsumerWidget {
  const PplComplaintReportPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text("Laporan Petani", style: largeReguler),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("ppl-history-report-complaint");
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: MobileComplaintReport(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    var height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      title: "Complain Report",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Laporan Petani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("ppl-history-report-complaint");
            },
            icon: const Icon(Icons.history),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.02),
          child: SafeArea(
            child: MobileComplaintReport(ref: ref),
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebComplaintReport(ref: ref),
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
