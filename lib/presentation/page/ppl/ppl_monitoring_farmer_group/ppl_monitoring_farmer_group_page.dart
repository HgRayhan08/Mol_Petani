import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring_farmer_group/mobile/mobile_monitoring_farmer_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring_farmer_group/website/web_monitoring_farmer_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplMonitoringFarmerGroupPage extends ConsumerWidget {
  final UserFarmerGroup user;
  const PplMonitoringFarmerGroupPage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.farmerGrup),
        ),
        body: MobileMonitoringFarmerGroup(ref: ref, user: user));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: user.farmerGrup,
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("monitoring-page");
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            user.farmerGrup,
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileMonitoringFarmerGroup(ref: ref, user: user),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueLight,
        leadingWidth: width * 0.06,
        toolbarHeight: height * 0.05,
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: const Color(0xff7BD3EA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {
            ref.read(routerProvider).goNamed("main-ppl");
          },
          child: Text(
            "Back",
            style: regulerReguler.copyWith(color: Colors.white),
          ),
        ),
      ),
      body: WebMonitoringFarmerGroup(ref: ref, user: user),
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
