import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/user_login/method/dropdown_login.dart';
import 'package:mol_petani/presentation/page/user_login/method/form_login_farmer.dart';
import 'package:mol_petani/presentation/page/user_login/method/logic_login.dart';
import 'package:mol_petani/presentation/page/user_login/method/opener_petani.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class WebsiteLoginFarmer extends ConsumerStatefulWidget {
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  const WebsiteLoginFarmer({
    super.key,
    required this.emailControler,
    required this.passwordControler,
  });

  @override
  ConsumerState<WebsiteLoginFarmer> createState() => _WebsiteLoginFarmerState();
}

class _WebsiteLoginFarmerState extends ConsumerState<WebsiteLoginFarmer> {
  String? selectedValue;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      openerPetani(context),
                      DropdownLogin(
                        wisthContainer: width * 0.3,
                        width: width * 0.3,
                        height: height,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      formLoginFarmer(
                        context,
                        key: _formKey,
                        email: widget.emailControler,
                        password: widget.passwordControler,
                      ),
                      SizedBox(height: height * 0.03),
                      const Divider(),
                      SizedBox(height: height * 0.03),
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
                                onPressed: _isLoading ? null : _login,
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
                      SizedBox(height: height * 0.03),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, height * 0.05),
                          padding:
                              EdgeInsets.symmetric(vertical: width * 0.012),
                          backgroundColor: const Color(0xff7BD3EA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ref.read(routerProvider).goNamed("register-ppl");
                        },
                        child: Text(
                          "Registrasi",
                          style: buttonReguler.copyWith(
                            color: light,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    final login = LogicLogin(
        ref: ref,
        context: context,
        emailControler: widget.emailControler,
        passwordControler: widget.passwordControler,
        selectValue: selectedValue.toString());
    login.login((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
