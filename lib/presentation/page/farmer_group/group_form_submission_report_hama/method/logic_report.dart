// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LogicReport {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController reportingController;
  final TextEditingController detailReportingController;
  final String selectedValue;
  LogicReport({
    required this.ref,
    required this.context,
    required this.reportingController,
    required this.detailReportingController,
    required this.selectedValue,
  });

  Future<void> create(Function setLoading) async {
    if (reportingController.text.isEmpty ||
        detailReportingController.text.isEmpty) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);
      // try {
      bool result =
          await ref.read(reportProviderProvider.notifier).createReportHama(
                reporting: reportingController.text,
                detailReporting: detailReportingController.text,
                idUserFarmer: selectedValue.toString(),
              );

      if (result == false) {
        context.buildAlertInformation(
            title: "Pesan", subTitle: "Berhasil Menambahkan Data");
        Future.delayed(
          const Duration(seconds: 5),
          () {
            ref.read(routerProvider).goNamed("report-hama");
          },
        );
      } else {
        context.buildAlertInformation(
            title: "Pesan", subTitle: "Gagal Menambahkan Data");
        setLoading(false);
      }
      // } catch (e) {
      //   context.buildAlertInformation(
      //       title: "Pesan", subTitle: "Terjadi kesalahan: $e");
      // } finally {
      //   setLoading(false);
      // }
    }
  }
}
