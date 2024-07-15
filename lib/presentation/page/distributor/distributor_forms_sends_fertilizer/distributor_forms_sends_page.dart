import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/mobile/mobile_form_send.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/website/web_form_send.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class DistributorFormsSendsPage extends ConsumerStatefulWidget {
  const DistributorFormsSendsPage({super.key});

  @override
  ConsumerState<DistributorFormsSendsPage> createState() =>
      _DistributorFormsSendsPageState();
}

class _DistributorFormsSendsPageState
    extends ConsumerState<DistributorFormsSendsPage> {
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController yearControler = TextEditingController();
  final TextEditingController sendControler = TextEditingController();
  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  String? selectedValue;

  @override
  void dispose() {
    nameControler.dispose();
    yearControler.dispose();
    sendControler.dispose();
    ureaControler.dispose();
    poskaControler.dispose();
    super.dispose();
  }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: MobileFormSend(
          ref: ref,
          nameControler: nameControler,
          yearControler: yearControler,
          sendControler: sendControler,
          ureaControler: ureaControler,
          poskaControler: poskaControler),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Pengiriman Pupuk",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
                onPressed: () {
                  ref.read(routerProvider).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            middle: Text(
              "Pengiriman Pupuk",
              style: largeReguler,
            ),
          ),
          child: SafeArea(
            child: MobileFormSend(
                ref: ref,
                nameControler: nameControler,
                yearControler: yearControler,
                sendControler: sendControler,
                ureaControler: ureaControler,
                poskaControler: poskaControler),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
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
        body: WebFormSend(
            ref: ref,
            nameControler: nameControler,
            yearControler: yearControler,
            sendControler: sendControler,
            ureaControler: ureaControler,
            poskaControler: poskaControler),
      ),
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
