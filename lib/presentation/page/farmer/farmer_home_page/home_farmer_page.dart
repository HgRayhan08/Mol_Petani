import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_home_page/mobile/mobile_home_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/method/information_farmer.dart';
import 'package:mol_petani/presentation/provider/weather/weather_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class HomeFarmerPage extends ConsumerStatefulWidget {
  const HomeFarmerPage({super.key});

  @override
  ConsumerState<HomeFarmerPage> createState() => _HomeFarmerPageState();
}

class _HomeFarmerPageState extends ConsumerState<HomeFarmerPage> {
  Position? position;

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: informationFarmer(ref, width, height),
      body: MobileHomeFarmer(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Home Petani",
      home: CupertinoPageScaffold(
        child: SafeArea(
          child: MobileHomeFarmer(ref: ref),
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
