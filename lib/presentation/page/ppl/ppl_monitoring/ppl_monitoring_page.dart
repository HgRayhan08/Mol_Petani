import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring/mobile/mobile_monitoring.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring/website/web_monitoring.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplMonitoringPage extends ConsumerWidget {
  const PplMonitoringPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Monitoring", style: largeReguler),
        ),
        body: MobileMonitoring(ref: ref));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Monitoring",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Monitoring",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileMonitoring(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebMonitoring(ref: ref),
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
