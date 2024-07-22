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
  final TextEditingController kartuController;
  final TextEditingController luasController;
  final String tanggalLahirController;
  final String jenisKelamin;
  Registerfarmer({
    required this.ref,
    required this.context,
    required this.nameController,
    required this.villageController,
    required this.nikController,
    required this.noHpController,
    required this.kartuController,
    required this.luasController,
    required this.tanggalLahirController,
    required this.jenisKelamin,
  });

  Future<void> logicCreate(Function setLoading) async {
    if (nameController.text == "" ||
        villageController.text == "" ||
        nikController.text == "" ||
        noHpController.text == "" ||
        kartuController.text == "" ||
        luasController.text == "" ||
        tanggalLahirController == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref.read(dataUserProvider.notifier).createFarmer(
              name: nameController.text,
              village: villageController.text,
              nik: nikController.text,
              kartuKeluarga: kartuController.text,
              luasLahan: luasController.text,
              jenisKelamin: jenisKelamin,
              noHp: noHpController.text,
              dateOfBirth: tanggalLahirController,
            );

        if (result == true) {
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
