import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/all_login_page/method/form_login.dart';
import 'package:mol_petani/presentation/page/all_login_page/method/login_with.dart';
import 'package:mol_petani/presentation/page/all_login_page/method/opener_petugas.dart';
import 'package:mol_petani/presentation/page/all_login_page/method/text_bottom_petugas.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LoginDistributorPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  LoginDistributorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed("main-dist");
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User tidak ada"),
            ),
          );
        }
      },
    );

    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: mediaWidth * 0.2),
        children: [
          Image.asset(
            "assets/logo.png",
            height: 70,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: mediaHeight * 0.05,
          ),
          openerPetugas(title: "Distributor"),
          SizedBox(height: mediaHeight * 0.03),
          formLogin(context,
              email: emailControler, password: passwordControler),
          switch (ref.watch(dataUserProvider)) {
            AsyncData(:final value) => value == null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xff7BD3EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (emailControler.text == "" ||
                          passwordControler.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mohon Lengkapi data"),
                          ),
                        );
                      } else {
                        ref.read(dataUserProvider.notifier).loginDistributor(
                            email: emailControler.text,
                            password: passwordControler.text);
                      }
                    },
                    child: Text(
                      "Login",
                      style: buttonReguler.copyWith(
                          fontWeight: FontWeight.bold, color: light),
                    ))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            _ => const Center(child: CircularProgressIndicator()),
          },
          SizedBox(
            height: mediaHeight * 0.04,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Atau Login Sebagai",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: mediaHeight * 0.03),
          loginWith(
            ref,
            first: "Petani",
            toPageFirst: "login-petani",
            seccond: "Penyuluh Pertanian Lapangan",
            toPageSecond: "login-ppl",
            thrid: "Kelompok Tani",
            toPagethrid: "login-kelompok",
          ),
          SizedBox(height: mediaHeight * 0.08),
          textBottomPetugas(title: "Distributor"),
        ],
      ),
    );
  }
}
