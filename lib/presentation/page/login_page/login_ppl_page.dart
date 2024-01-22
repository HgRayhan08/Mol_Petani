import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/page/login_page/method/form_login.dart';
import 'package:mol_petani/presentation/page/login_page/method/login_with.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

class LoginPplPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  LoginPplPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserPetugasProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed("main-ppl");
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
          const Column(
            children: [
              Text(
                "Login to your Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Penyuluh Pertanian Lapangan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: mediaHeight * 0.03),
          formLogin(context,
              email: emailControler, password: passwordControler),
          switch (ref.watch(dataUserPetugasProvider)) {
            AsyncData(:final value) => value == null
                ? ElevatedButton(
                    onPressed: () {
                      if (emailControler.text == "" ||
                          passwordControler.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mohon Lengkapi data"),
                          ),
                        );
                      } else {
                        ref.read(dataUserPetugasProvider.notifier).loginPpl(
                            email: emailControler.text,
                            password: passwordControler.text);
                      }
                    },
                    child: const Text("Login"))
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
            seccond: "Distributor",
            toPageSecond: "login-petani",
            thrid: "Kelompok Tani",
            toPagethrid: "login-kelompok",
          ),
          SizedBox(height: mediaHeight * 0.12),
          const Align(
            child: Column(
              children: [
                Text(
                  "Login for Penyuluh Pertanian ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lapangan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
