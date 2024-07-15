import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_accepted_fertilizer/mobile/mobile_accepted_fertilizer.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_accepted_fertilizer/website/web_accepted_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class FarmerAcceptedFertilizerpage extends ConsumerWidget {
  const FarmerAcceptedFertilizerpage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peneriamaan Pupuk", style: largeReguler),
      ),
      body: MobileAcceptedFertilizer(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Peneriamaan Pupuk",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Peneriamaan Pupuk",
              style: largeReguler,
            ),
          ),
          child: SafeArea(
            child: MobileAcceptedFertilizer(ref: ref),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebAcceptedFertilizer(ref: ref),
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
