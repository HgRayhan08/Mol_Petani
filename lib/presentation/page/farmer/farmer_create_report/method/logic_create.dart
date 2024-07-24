// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class LogicCreateReport {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController judulControler;
  final TextEditingController deskripsiController;

  LogicCreateReport({
    required this.ref,
    required this.context,
    required this.judulControler,
    required this.deskripsiController,
  });

  Future<void> create(Function setLoading) async {
    if (judulControler.text == "" || deskripsiController.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref
            .read(reportProviderProvider.notifier)
            .createReport(
                reporting: judulControler.text,
                reportingDetail: deskripsiController.text);

        if (result == false) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).goNamed("farmer-report");
            },
          );
        } else {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Gagal Menambahkan Data");
        }
      } catch (e) {
        context.buildAlertInformation(
            title: "Pesan", subTitle: "Terjadi kesalahan: $e");
      } finally {
        setLoading(false);
      }
    }
  }
}
