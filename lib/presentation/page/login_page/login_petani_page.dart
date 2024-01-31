import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/login_page/method/form_login.dart';
import 'package:mol_petani/presentation/page/login_page/method/login_with.dart';
import 'package:mol_petani/presentation/page/login_page/method/opener_petani.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class LoginPetaniPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  LoginPetaniPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed("main-ppl");
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
          openerPetani(context),
          formLogin(
            context,
            email: emailControler,
            password: passwordControler,
          ),
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
                      ref.read(dataUserProvider.notifier).loginPpl(
                          email: emailControler.text,
                          password: passwordControler.text);
                    },
                    child: Text(
                      "Login",
                      style: buttonReguler.copyWith(
                        color: light,
                        fontWeight: FontWeight.bold,
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
          Align(
            alignment: Alignment.center,
            child: Text(
              "atau login sebagai",
              style: regulerReguler,
            ),
          ),
          SizedBox(
            height: mediaHeight * 0.03,
          ),
          loginWith(
            ref,
            first: "Penyuluh Pertanian Lapangan",
            toPageFirst: "login-ppl",
            seccond: "Distributor",
            toPageSecond: "login-dis",
            thrid: "Kelompok Tani",
            toPagethrid: "login-kelompok",
          ),
          Padding(
            padding: EdgeInsets.only(top: mediaHeight * 0.08),
            child: Column(
              children: [
                Text(
                  "Belum punya akun?",
                  style: smallReguler,
                ),
                Text(
                  "Hubungi Ketua keompok tani daerah anda",
                  style: smallReguler,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
