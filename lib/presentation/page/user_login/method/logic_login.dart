// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LogicLogin {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  final String selectValue;
  LogicLogin({
    required this.ref,
    required this.context,
    required this.emailControler,
    required this.passwordControler,
    required this.selectValue,
  });

  Future<void> login(Function setLoading) async {
    if (emailControler.text == "" || passwordControler.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref.read(dataUserProvider.notifier).loginUser(
              email: emailControler.text,
              password: passwordControler.text,
              user: selectValue,
            );

        if (result == true) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Login");
        } else {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Login Tidak Sesuai");
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
