import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class RegisterLogic {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController grupFarmerController;
  final TextEditingController villageController;
  final TextEditingController leaderNameController;
  final TextEditingController nikController;
  final TextEditingController handphoneController;
  final XFile xFile;

  RegisterLogic({
    required this.ref,
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.grupFarmerController,
    required this.villageController,
    required this.leaderNameController,
    required this.nikController,
    required this.handphoneController,
    required this.xFile,
  });

  Future<void> logicCreate(Function setLoading) async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        grupFarmerController.text.isEmpty ||
        villageController.text.isEmpty) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result =
            await ref.read(dataUserProvider.notifier).registerGrupFarmer(
                  leaderName: leaderNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  kelompok: grupFarmerController.text,
                  fotoUrl: File(xFile.path),
                  village: villageController.text,
                  familyIdentificationNumber: nikController.text,
                  mobileNumber: int.parse(handphoneController.text),
                );

        if (result==false) {
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
