import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_report/mobile/mobile_report.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_report/website/web_report.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class FarmerReportPage extends ConsumerWidget {
  const FarmerReportPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          "Laporan Petani",
          style: largeReguler,
        ),
      ),
      body: MobileReport(ref: ref),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("farmer-create-report");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Laporan Petani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("farmer-create-report");
            },
            icon: const Icon(Icons.add),
          ),
        ),
        child: SafeArea(
          child: MobileReport(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebReport(ref: ref),
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
