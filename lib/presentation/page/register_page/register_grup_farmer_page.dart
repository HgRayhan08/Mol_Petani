import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/register_page/method/form_register_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class RegisterGrupFarmerPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController grupFarmerKontroler = TextEditingController();
  final TextEditingController vilageControler = TextEditingController();
  RegisterGrupFarmerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Grup Farmer",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Input Data Grup farmer",
                  style: largeReguler.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          formRegisterGrup(
            mediaQueryHeight,
            emailcontroler: emailControler,
            passwordcontroler: passwordControler,
            namecontroler: nameControler,
            grupcontroler: grupFarmerKontroler,
            vilagecontroler: vilageControler,
          ),
          SizedBox(
            height: mediaQueryHeight * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              if (emailControler.text == "" ||
                  passwordControler.text == "" ||
                  nameControler.text == "" ||
                  grupFarmerKontroler.text == "" ||
                  vilageControler.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("Please enter the data completely"),
                  ),
                );
              } else {
                ref.read(dataUserProvider.notifier).registerGrupFarmer(
                      nama: nameControler.text,
                      email: emailControler.text,
                      password: passwordControler.text,
                      kelompok: grupFarmerKontroler.text,
                      fotoUrl: "",
                      desa: vilageControler.text,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: light,
                    duration: const Duration(seconds: 4),
                    content: Text(
                      "Create Account is Succes",
                      style: regulerReguler.copyWith(
                        color: dark,
                      ),
                    ),
                  ),
                );
                Future.delayed(
                  const Duration(seconds: 5),
                  () {
                    ref.read(routerProvider).pop();
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              backgroundColor: const Color(0xff7BD3EA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Register",
              style: buttonReguler.copyWith(color: light),
            ),
          ),
        ],
      ),
    );
  }
}
