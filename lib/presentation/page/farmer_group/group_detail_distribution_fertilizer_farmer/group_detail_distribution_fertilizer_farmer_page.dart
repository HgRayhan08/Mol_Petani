import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/method/accepted_informatition.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/method/sharing_information.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/mobile/mobile_detail_distribution.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/website/web_detail_distribution.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDetailDistributionFertilizerFarmerPage extends ConsumerWidget {
  final DistributionFertilizerFarmer data;
  const GroupDetailDistributionFertilizerFarmerPage(this.data, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.farmerName),
        ),
        body: MobileDetailDistribution(ref: ref, data: data));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            data.farmerName,
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileDetailDistribution(ref: ref, data: data),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: Icon(Icons.close)),
        ),
        body: WebDetailDistribution(ref: ref, data: data),
      ),
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
