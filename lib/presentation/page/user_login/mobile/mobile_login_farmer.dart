import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/user_login/method/dropdown_login.dart';
import 'package:mol_petani/presentation/page/user_login/method/form_login_farmer.dart';
import 'package:mol_petani/presentation/page/user_login/method/opener_petani.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MobileLoginFarmer extends ConsumerStatefulWidget {
  final TextEditingController emailControler;
  final TextEditingController passwordControler;
  const MobileLoginFarmer({
    super.key,
    required this.emailControler,
    required this.passwordControler,
  });

  @override
  ConsumerState<MobileLoginFarmer> createState() => _MobileLoginFarmerState();
}

class _MobileLoginFarmerState extends ConsumerState<MobileLoginFarmer> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
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
          DropdownLogin(
            width: mediaWidth,
            height: mediaHeight,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          SizedBox(height: mediaHeight * 0.02),
          formLoginFarmer(
            context,
            email: widget.emailControler,
            password: widget.passwordControler,
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
                      ref.read(dataUserProvider.notifier).loginUser(
                            email: widget.emailControler.text,
                            password: widget.passwordControler.text,
                            user: selectedValue!,
                          );
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
            height: mediaHeight * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "atau login sebagai",
              style: regulerReguler,
            ),
          ),
          SizedBox(
            height: mediaHeight * 0.02,
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
