import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/mobile/mobile_detail_monitoring_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/website/web_detail_monitoring_group.dart';

import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailMonitoringFarmerGroupPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  final UserFarmerGroup user;
  const PplDetailMonitoringFarmerGroupPage(this.data, this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("monitoring-group", extra: user);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text("Detail Distribusi Pupuk", style: largeReguler),
      ),
      body: MobileDetailMonitoringGroup(
        ref: ref,
        data: data,
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      title: "Detail Distribusi Pupuk",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref
                    .read(routerProvider)
                    .goNamed("monitoring-group", extra: user);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Detail Distribusi Pupuk",
            style: largeReguler,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.02),
          child: SafeArea(
            child: MobileDetailMonitoringGroup(
              ref: ref,
              data: data,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.6,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          toolbarHeight: height * 0.05,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: ListView(
          children: [
            WebDetailMonitoringGroup(ref: ref, data: data),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
      androidBuilder: buildAndroid,
      iosBuilder: buildIos,
      webBuilder: buildWeb,
    );
  }
}
