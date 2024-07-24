import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class LogicSend {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController nameControler;
  final TextEditingController yearControler;
  final TextEditingController sendControler;
  final TextEditingController ureaControler;
  final TextEditingController poskaControler;
  final String selectedValue;

  LogicSend({
    required this.ref,
    required this.context,
    required this.nameControler,
    required this.yearControler,
    required this.sendControler,
    required this.ureaControler,
    required this.poskaControler,
    required this.selectedValue,
  });

  Future<void> create(Function setLoading) async {
    if (nameControler.text == "" ||
        yearControler == "" ||
        sendControler.text == "" ||
        ureaControler.text == "" ||
        poskaControler.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref
            .read(fertilizerSubmissionProvider.notifier)
            .createSendFertilizerGroup(
              idGroupFarmer: selectedValue.toString(),
              nameDistributor: nameControler.text,
              year: yearControler.text,
              send: int.parse(sendControler.text),
              sendUrea: int.parse(ureaControler.text),
              sendPoska: int.parse(poskaControler.text),
            );
        if (result==false) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).pop();
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
