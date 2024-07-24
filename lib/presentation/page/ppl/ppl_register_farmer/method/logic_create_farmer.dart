import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class Registerfarmer {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController nameController;
  final TextEditingController villageController;
  final TextEditingController nikController;
  final TextEditingController noHpController;
  final TextEditingController luasController;
  final String jenisKelamin;
  Registerfarmer({
    required this.ref,
    required this.context,
    required this.nameController,
    required this.villageController,
    required this.nikController,
    required this.noHpController,
    required this.luasController,
    required this.jenisKelamin,
  });

  Future<void> logicCreate(Function setLoading) async {
    if (nameController.text == "" ||
        villageController.text == "" ||
        nikController.text == "" ||
        noHpController.text == "" ||
        luasController.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref.read(dataUserProvider.notifier).createFarmer(
              name: nameController.text,
              village: villageController.text,
              nik: nikController.text,
              luasLahan: luasController.text,
              jenisKelamin: jenisKelamin,
              noHp: noHpController.text,
            );

        if (result == false) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).goNamed("data-farmer-ppl");
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
