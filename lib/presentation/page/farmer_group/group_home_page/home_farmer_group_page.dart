import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/method/information_user.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/method/sub_menu_grup_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/mobile/mobile_home_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_home_page/method/information_user_ppl.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class HomeFarmerGroupPage extends ConsumerWidget {
  const HomeFarmerGroupPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueLight,
        title: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            "assets/logo2.png",
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: informationUserGroup(context, ref),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: const MobileHomeGroup(
        shrinkWrap: false,
      ),
    );
  }

  Widget buildios(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/logo2.png",
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.02,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.03),
              height: height * 0.15,
              decoration: const BoxDecoration(
                color: blueLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: informationUserGroup(context, ref),
            ),
            const MobileHomeGroup(
              shrinkWrap: true,
            ),
          ],
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
        iosBuilder: buildios,
        webBuilder: buildWeb);
  }
}
