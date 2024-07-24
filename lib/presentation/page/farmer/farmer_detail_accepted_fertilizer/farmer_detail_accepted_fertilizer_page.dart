import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_accepted_fertilizer/mobile/mobile_detail_accepted.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_accepted_fertilizer/website/web_detail_accepted.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class FarmerDetailAcceptedFertilizerPage extends ConsumerWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  const FarmerDetailAcceptedFertilizerPage(this.dataFertilizer, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            "Detail Penerimaan Pupuk",
            style: largeReguler,
          ),
        ),
        body: MobileDetailAccepted(dataFertilizer: dataFertilizer, ref: ref));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Penerimaan Pupuk",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Detail Penerimaan Pupuk",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileDetailAccepted(dataFertilizer: dataFertilizer, ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.6,
      height: height * 0.5,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(
                Icons.cancel,
              )),
        ),
        body: WebDetailAccepted(dataFertilizer: dataFertilizer, ref: ref),
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
