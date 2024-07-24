import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LogicRegister {
  final WidgetRef ref;
  final BuildContext context;
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  final UserFarmer user;

  LogicRegister({
    required this.ref,
    required this.context,
    required this.emailControler,
    required this.passwordControler,
    required this.user,
  });

  Future<void> register(Function setLoading) async {
    if (emailControler.text.isEmpty || passwordControler.text.isEmpty) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        bool result = await ref
            .read(dataUserProvider.notifier)
            .updateAccountFarmer(
                email: emailControler.text,
                password: passwordControler.text,
                idDocument: user.idDocument!);

        if (result) {
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
