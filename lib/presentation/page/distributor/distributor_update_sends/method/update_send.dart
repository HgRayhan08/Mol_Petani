import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class UpdateSendFertilizer {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController sendController;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  final SubmissionKuotaFertilizer data;
  UpdateSendFertilizer({
    required this.ref,
    required this.context,
    required this.sendController,
    required this.ureaController,
    required this.poskaController,
    required this.data,
  });

  Future<void> update(Function setLoading) async {
    if (sendController.text == "" ||
        ureaController.text == "" ||
        poskaController.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref
            .read(fertilizerSubmissionProvider.notifier)
            .updateSendFertilizer(
              send: int.parse(sendController.text),
              sendUrea: int.parse(ureaController.text),
              sendPoska: int.parse(poskaController.text),
              idDocument: data.idDocument.toString(),
            );
        if (result == false) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Update Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref
                  .read(routerProvider)
                  .goNamed("detail-send-fertilizer", extra: data);
            },
          );
        } else {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Gagal Update Data");
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
