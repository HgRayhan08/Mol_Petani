// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class LogicAcception {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  final TextEditingController plantController;
  final DistributionFertilizerFarmer dataFertilizer;

  LogicAcception({
    required this.ref,
    required this.context,
    required this.ureaController,
    required this.poskaController,
    required this.plantController,
    required this.dataFertilizer,
  });

  Future<void> create(Function setLoading) async {
    if (ureaController.text == "" ||
        poskaController.text == "" ||
        plantController.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      final int acceptedUrea = int.parse(ureaController.text);
      final int acceptedPoska = int.parse(poskaController.text);
      try {
        bool result = await ref
            .read(fertilizerSubmissionProvider.notifier)
            .updateReceptionFertilizerGroup(
                idDocument: dataFertilizer.idDocumennt.toString(),
                acceptUrea: acceptedUrea,
                acceptPoska: acceptedPoska,
                plant: plantController.text);

        if (result == true) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).goNamed(
                    "farmer-detail-accepted",
                    extra: dataFertilizer,
                  );
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
