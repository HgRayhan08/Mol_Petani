import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/mobile/mobile_form_report_hama.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/website/web_form_report_hama.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupFormReportHamaPage extends ConsumerStatefulWidget {
  const GroupFormReportHamaPage({super.key});

  @override
  ConsumerState<GroupFormReportHamaPage> createState() =>
      _GroupFormReportHamaPageState();
}

class _GroupFormReportHamaPageState
    extends ConsumerState<GroupFormReportHamaPage> {
  String? selectedValue;

  final TextEditingController reportingController = TextEditingController();
  final TextEditingController detailReportingController =
      TextEditingController();

  void _onValueChanged(String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pelaporan Hama',
          style: largeReguler,
        ),
      ),
      body: MobileFormReportHama(
        ref: ref,
        reportingController: reportingController,
        detailReportingController: detailReportingController,
      ),
    );
  }

  Widget buildIosd(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Petani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("report-hama");
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Laporan",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              if (reportingController.text == "" ||
                  detailReportingController.text == "") {
                context.buildAlertInformation(
                    title: "Pesan",
                    subTitle: "Please enter the data completely");
              } else {
                context.buildAlertInformation(
                    title: "Pesan", subTitle: "Berhasil Menambahkan Data");
                ref.read(reportProviderProvider.notifier).createReportHama(
                      reporting: reportingController.text,
                      detailReporting: detailReportingController.text,
                      idUserFarmer: selectedValue!,
                    );
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    ref.read(routerProvider).goNamed("report-hama");
                  },
                );
              }
            },
            icon: const Icon(Icons.check),
          ),
        ),
        child: SafeArea(
          child: MobileFormReportHama(
            ref: ref,
            reportingController: reportingController,
            detailReportingController: detailReportingController,
            selectedValue: selectedValue,
            onValueChanged: _onValueChanged,
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
      height: height * 0.8,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.close)),
        ),
        body: WebFormReportHama(
            ref: ref,
            reportingController: reportingController,
            detailReportingController: detailReportingController),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIosd,
        webBuilder: buildWeb);
  }
}
