import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/user_login/method/form_login_farmer.dart';
import 'package:mol_petani/presentation/page/user_login/method/login_width_in_farmer.dart';
import 'package:mol_petani/presentation/page/user_login/method/opener_petani.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class WebsiteLoginFarmer extends ConsumerWidget {
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  const WebsiteLoginFarmer({
    super.key,
    required this.emailControler,
    required this.passwordControler,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: width * 0.5,
            decoration: const BoxDecoration(
              color: blueLight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo2.png",
                  height: width * 0.1,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Monitoring Lahan Pertanian",
                  style: extraLarge.copyWith(
                    color: light,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width * 0.5,
            decoration: const BoxDecoration(
              color: light,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.1,
                    right: width * 0.1,
                  ),
                  child: Column(
                    children: [
                      openerPetani(context),
                      formLoginFarmer(
                        context,
                        email: emailControler,
                        password: passwordControler,
                      ),
                      switch (ref.watch(dataUserProvider)) {
                        AsyncData(:final value) => value == null
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(double.infinity, height * 0.05),
                                  padding: EdgeInsets.symmetric(
                                      vertical: width * 0.012),
                                  backgroundColor: const Color(0xff7BD3EA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  // ref
                                  //     .read(dataUserProvider.notifier)
                                  //     .loginFarmer(
                                  //         email: emailControler.text,
                                  //         password: passwordControler.text);
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
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  child: loginWithInFarmer(
                    ref,
                    first: "Penyuluh Pertanian Lapangan",
                    toPageFirst: "login-ppl",
                    seccond: "Distributor",
                    toPageSecond: "login-dis",
                    thrid: "Kelompok Tani",
                    toPagethrid: "login-kelompok",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
