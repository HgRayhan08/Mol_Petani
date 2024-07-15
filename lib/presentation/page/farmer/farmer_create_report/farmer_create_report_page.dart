import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_create_report/mobile/mobile_create_report.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_create_report/website/web_create_report.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class FarmerCreateReportPage extends ConsumerStatefulWidget {
  const FarmerCreateReportPage({super.key});

  @override
  ConsumerState<FarmerCreateReportPage> createState() =>
      _FarmerCreateReportPageState();
}

class _FarmerCreateReportPageState
    extends ConsumerState<FarmerCreateReportPage> {
  TextEditingController judulControler = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  void dispose() {
    judulControler.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Membuat Laporan",
          style: regulerReguler,
        ),
      ),
      body: MobileCreateReport(
        ref: ref,
        judulControler: judulControler,
        deskripsiController: deskripsiController,
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
      title: "Membuat Laporan",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Membuat Laporan",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileCreateReport(
            ref: ref,
            judulControler: judulControler,
            deskripsiController: deskripsiController,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.5,
      height: height * 0.9,
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
        body: WebCreateReport(
            ref: ref,
            judulControler: judulControler,
            deskripsiController: deskripsiController),
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
