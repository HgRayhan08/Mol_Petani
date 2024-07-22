import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/profile_farmer/mobile/mobile_farmer_profile.dart';
import 'package:mol_petani/presentation/page/farmer_group/profile_group/mobile/mobile_group_profile.dart';
import 'package:mol_petani/presentation/page/profile/mobile/mobile_profile.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class ProfileFarmerPage extends StatefulWidget {
  const ProfileFarmerPage({super.key});

  @override
  State<ProfileFarmerPage> createState() => _ProfileFarmerPageState();
}

class _ProfileFarmerPageState extends State<ProfileFarmerPage> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueLight,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "User Profile",
          style: largeReguler.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MobileFarmerProfile(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Profile",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Profile",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileFarmerProfile(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
