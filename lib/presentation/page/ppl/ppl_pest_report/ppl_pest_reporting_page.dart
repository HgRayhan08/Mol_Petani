import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_pest_report/mobile/mobile_pest_report.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_pest_report/website/web_pest_report.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplPestReportingPage extends ConsumerWidget {
  const PplPestReportingPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          "Laporan Hama",
          style: largeReguler,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("ppl-history-pest-reporting");
            },
            icon: const Icon(Icons.history),
          )
        ],
      ),
      body: MobilePestReport(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      title: "Laporan Hama",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          trailing: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("ppl-history-pest-reporting");
              },
              icon: const Icon(Icons.history)),
          middle: Text(
            "Laporan Hama",
            style: largeReguler,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.02),
          child: SafeArea(
            child: MobilePestReport(ref: ref),
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WebPestReport(ref: ref),
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
