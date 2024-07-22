import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/mobile/mobile_data_farmer.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_data_farmer/website/web_data_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDataFarmer extends ConsumerStatefulWidget {
  const PplDataFarmer({super.key});

  @override
  ConsumerState<PplDataFarmer> createState() => _PplDataFarmerState();
}

class _PplDataFarmerState extends ConsumerState<PplDataFarmer> {
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
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(routerProvider).pushNamed("regis-farmer");
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "data Petani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Petani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(routerProvider).pushNamed("regis-farmer");
              setState(() {});
            },
            icon: const Icon(Icons.add),
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
      body: WebDataFarmer(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
