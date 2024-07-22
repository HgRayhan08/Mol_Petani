import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_distributor_data/mobile/mobile_data_distributor.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_distributor_data/web/web_data_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDistributorDataPage extends ConsumerStatefulWidget {
  const PplDistributorDataPage({super.key});

  @override
  ConsumerState<PplDistributorDataPage> createState() =>
      _PplDistributorDataPageState();
}

class _PplDistributorDataPageState
    extends ConsumerState<PplDistributorDataPage> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Distributor",
          style: regulerReguler.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: MobileDataDistributor(ref: ref),
      floatingActionButton: IconButton(
        onPressed: () {
          ref.watch(routerProvider).goNamed("regis-distributor");
          setState(() {});
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget buildAios(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Distributor",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Distributor",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref.watch(routerProvider).pushNamed("regis-distributor");
            },
            icon: const Icon(Icons.add),
          ),
        ),
        child: SafeArea(
          child: MobileDataDistributor(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebDataDistributor(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: buildAndroid,
      iosBuilder: buildAios,
      webBuilder: buildWeb,
    );
  }
}
