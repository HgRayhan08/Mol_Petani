import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_pest_report/mobile/mobile_history_pest.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_pest_report/website/web_history_pest.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplHistoryPestReportPage extends ConsumerWidget {
  const PplHistoryPestReportPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          "History Laporan",
          style: largeReguler,
        ),
      ),
      body: MobileHistoryPest(ref: ref),
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
          child: MobileHistoryPest(ref: ref),
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
      body: WebHistoryPest(ref: ref),
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
