import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/mobile/mobile_data_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/website/web_all_data_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_farmer_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';
import 'package:mol_petani/presentation/widgets/search_widget.dart';

class GroupDataFarmerpage extends ConsumerWidget {
  const GroupDataFarmerpage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Petani",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MobileDataFarmer(ref: ref),
      // floatingActionButton: IconButton(
      //   onPressed: () {
      //     ref.read(routerProvider).pushNamed("forms-farmer");
      //   },
      //   icon: const Icon(Icons.add),
      // ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
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
            "Data Petani",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileDataFarmer(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebAllDataFarmer(ref: ref),
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
