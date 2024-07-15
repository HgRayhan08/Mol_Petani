import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_farmer_grup_data/mobile/mobile_data_farmer_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_farmer_grup_data/website/website_data_farmer_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplFarmerGrupDataPage extends ConsumerStatefulWidget {
  const PplFarmerGrupDataPage({super.key});

  @override
  ConsumerState<PplFarmerGrupDataPage> createState() =>
      _PplFarmerGrupDataPageState();
}

class _PplFarmerGrupDataPageState extends ConsumerState<PplFarmerGrupDataPage> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Farmer Grup Data",
          style: regulerReguler.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: MobileDataFarmerGroup(ref: ref),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(routerProvider).pushNamed("regis-kelompok");
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Farmern Gropu",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Kelompok Tani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.watch(routerProvider).pushNamed("regis-kelompok");
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ),
        child: SafeArea(
          child: MobileDataFarmerGroup(ref: ref),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebsiteDataFarmerGroup(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWebsite);
  }
}
