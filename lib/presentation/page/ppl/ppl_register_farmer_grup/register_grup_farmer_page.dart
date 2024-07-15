import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer_grup/mobile/mobile_create_farmer_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer_grup/website/web_create_farmer_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplRegisterGrupFarmerPage extends StatelessWidget {
  const PplRegisterGrupFarmerPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrasi Kelompok Tani",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: MobileCreateFarmerGroup(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Registrasi Kelompok Tani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("data-grup-farmer");
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Registrasi Kelompok Tani",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: MobileCreateFarmerGroup(ref: ref),
          ),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
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
        body: WebCreateFarmerGroup(ref: ref),
      ),
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
