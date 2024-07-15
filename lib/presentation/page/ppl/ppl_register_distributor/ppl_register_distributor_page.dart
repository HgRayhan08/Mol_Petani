import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/mobile/mobile_create_distributor.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/website/web_create_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplRegisterDistributorPage extends ConsumerWidget {
  const PplRegisterDistributorPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Distributor",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("data-distributor");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: MobileCreateDistributor(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Register Distributor",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Register Distributor",
            style: largeReguler,
          ),
        ),
        child: MobileCreateDistributor(ref: ref),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.7,
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
        body: WebCreateDistributor(ref: ref),
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
