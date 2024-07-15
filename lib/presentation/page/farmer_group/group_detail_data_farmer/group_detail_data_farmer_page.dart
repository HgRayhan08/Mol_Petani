import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_data_farmer/mobile/mobile_detail_data_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_data_farmer/website/web_detail_data_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDetailDataFarmerPage extends ConsumerWidget {
  const GroupDetailDataFarmerPage(this.user, {super.key});
  final UserFarmer user;

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          width,
          height * 0.3 -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
        ),
        child: AppbarCustomWidget(
          height: height,
          width: width,
          title: "Detail Petani",
          content: user.name,
          subContext: Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                user.noHp,
                style: regulerReguler.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: MobileDetailDataFarmer(ref: ref, user: user),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Farmer",
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
          child: MobileDetailDataFarmer(ref: ref, user: user),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.6,
      width: width * 0.8,
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
        body: WebDetailDataFarmer(ref: ref, user: user),
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
