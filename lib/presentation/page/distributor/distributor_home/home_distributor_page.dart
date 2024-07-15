// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_home/mobile/mobile_home_distributor.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class HomeDistributorPage extends ConsumerWidget {
  const HomeDistributorPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/logo.png",
            width: width * 0.4,
          ),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shape: const Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        body: MobileHomeDistributor(ref: ref));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Home Distributor",
      home: CupertinoPageScaffold(
        child: SafeArea(
          child: MobileHomeDistributor(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
