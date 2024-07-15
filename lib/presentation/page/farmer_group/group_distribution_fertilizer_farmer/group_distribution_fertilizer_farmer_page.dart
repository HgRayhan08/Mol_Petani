import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/mobile/mobile_distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/website/web_distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_farmer_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDistributionFertilizerFarmerPage extends ConsumerWidget {
  const GroupDistributionFertilizerFarmerPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Distributution Pupuk", style: largeReguler),
        ),
        body: MobileDistributionFertilizerFarmer(
          ref: ref,
        ));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Distributution Pupuk",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Distributution Pupuk",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileDistributionFertilizerFarmer(
            ref: ref,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebDistributionFertilizerFarmer(ref: ref),
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
