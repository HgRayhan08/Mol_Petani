import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_update_sends/mobile/mobile_update_sends.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_update_sends/website/web_update_sends.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class DistributorUpdateSendsPage extends ConsumerWidget {
  final String idDocument;
  const DistributorUpdateSendsPage(this.idDocument, {super.key});

  Widget builAndroidd(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Pengiriman",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: MobileUpdateSends(
        ref: ref,
        idDocument: idDocument,
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Update Pengiriman",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Update Pengiriman",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileUpdateSends(
            ref: ref,
            idDocument: idDocument,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      height: height * 0.65,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebUpdateSends(
          ref: ref,
          idDocument: idDocument,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: builAndroidd,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
