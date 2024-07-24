import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LogicDistributor {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  final TextEditingController nameControler;
  final TextEditingController subdistrikControler;
  final TextEditingController nikControler;
  final TextEditingController handphoneConntroler;
  final TextEditingController tokoController;
  final XFile xfile;
  final List<String> coverage;

  LogicDistributor({
    required this.ref,
    required this.context,
    required this.emailControler,
    required this.passwordControler,
    required this.nameControler,
    required this.subdistrikControler,
    required this.nikControler,
    required this.handphoneConntroler,
    required this.tokoController,
    required this.xfile,
    required this.coverage,
  });

  Future<void> logicCreate(Function setLoading) async {
    if (emailControler.text.isEmpty ||
        passwordControler.text.isEmpty ||
        tokoController.text.isEmpty ||
        subdistrikControler.text.isEmpty) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result =
            await ref.read(dataUserProvider.notifier).registerDistributor(
                  nama: nameControler.text,
                  email: emailControler.text,
                  password: passwordControler.text,
                  scope: coverage,
                  address: subdistrikControler.text,
                  familyIdentificationNumber: nikControler.text,
                  image: File(xfile!.path),
                  toko: tokoController.text,
                  mobileNumber: int.parse(handphoneConntroler.text),
                );

        if (result== false) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).goNamed("data-grup-farmer");
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
