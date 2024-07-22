// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class CreatePpl {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController nameControler;
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  final TextEditingController kecamatanControler;
  final TextEditingController coverageControler;
  final TextEditingController nikController;
  final XFile xfile;
  final List<String> coverage;

  CreatePpl({
    required this.ref,
    required this.context,
    required this.nameControler,
    required this.emailControler,
    required this.passwordControler,
    required this.kecamatanControler,
    required this.coverageControler,
    required this.xfile,
    required this.nikController,
    required this.coverage,
  });

  Future<void> create(Function setLoading) async {
    if (emailControler.text == "" ||
        passwordControler.text == "" ||
        nameControler.text == "" ||
        coverage == []) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref.read(dataUserProvider.notifier).registerPpl(
              nama: nameControler.text,
              email: emailControler.text,
              password: passwordControler.text,
              subdistrict: kecamatanControler.text,
              image: File(xfile.path),
              nik: nikController.text,
              scope: coverage,
            );
        if (result) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          await ref.read(dataUserProvider.notifier).logoutPetugas();
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref.read(routerProvider).goNamed("user-login");
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
