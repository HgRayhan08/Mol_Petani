import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/login_page/method/form_login.dart';
import 'package:mol_petani/presentation/page/login_page/method/login_with.dart';
import 'package:mol_petani/presentation/page/login_page/method/opener_text.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/user_data_petugas_provider.dart';

class LoginPplPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  LoginPplPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataPetugasProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed("mainPpl");
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error poll"),
            ),
          );
        }
      },
    );

    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: mediaWidth * 0.2,
        ),
        children: [
          Image.asset(
            "assets/logo.png",
            height: 70,
            fit: BoxFit.contain,
          ),
          openerText(context),
          formLogin(
            context,
            email: emailControler,
            password: passwordControler,
          ),
          switch (ref.watch(userDataPetugasProvider)) {
            AsyncData(:final value) => value == null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7BD3EA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      ref.read(userDataPetugasProvider.notifier).loginPpl(
                          email: emailControler.text,
                          password: passwordControler.text);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
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
          SizedBox(
            height: mediaHeight * 0.03,
          ),
          loginWith(),
          Padding(
            padding: EdgeInsets.only(top: mediaHeight * 0.1),
            child: const Column(
              children: [
                Text(
                  "Belum punya akun?",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Hubungi Ketua keompok tani daerah anda",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
