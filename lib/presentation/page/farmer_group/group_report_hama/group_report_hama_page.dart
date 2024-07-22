import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_report_hama/mobile/mobile_reporting_hama.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_report_hama/website/web_reporting_hama.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listile_reporting_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupReportHamaPage extends ConsumerWidget {
  const GroupReportHamaPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Laporan Hama",
          style: largeReguler,
        ),
      ),
      body: MobileReportingHama(ref: ref),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("form-report-hama");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Petani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Laporan",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("form-report-hama");
            },
            icon: const Icon(Icons.add),
          ),
        ),
        child: SafeArea(
          child: MobileReportingHama(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebReportingHama(ref: ref),
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
