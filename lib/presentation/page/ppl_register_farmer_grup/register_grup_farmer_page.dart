import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl_register_farmer_grup/method/form_register_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class RegisterGrupFarmerPage extends ConsumerStatefulWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController leaderNameController = TextEditingController();
  final TextEditingController grupFarmerKontroler = TextEditingController();
  final TextEditingController vilageControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController handphoneConntroler = TextEditingController();
  RegisterGrupFarmerPage({super.key});

  @override
  ConsumerState<RegisterGrupFarmerPage> createState() =>
      _RegisterGrupFarmerPageState();
}

class _RegisterGrupFarmerPageState
    extends ConsumerState<RegisterGrupFarmerPage> {
  XFile? xFile;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrasi",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: width * 0.8,
              decoration: const BoxDecoration(
                color: blueLight,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grup Farmer",
                    style: extraLarge.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Enter Farmer Grup Data Correctly",
                    style: regulerReguler,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  xFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.01),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: xFile != null
                      ? Image.file(File(xFile!.path))
                      : const Center(
                          child: Icon(Icons.add),
                        ),
                ),
              ),
              Text(
                "Foto Profil",
                style: regulerReguler.copyWith(),
              )
            ],
          ),
          formRegisterFarmerGrup(
            height,
            emailcontroler: widget.emailControler,
            passwordcontroler: widget.passwordControler,
            namecontroler: widget.nameControler,
            leadernameController: widget.leaderNameController,
            grupcontroler: widget.grupFarmerKontroler,
            vilagecontroler: widget.vilageControler,
            nikControler: widget.nikControler,
            handphoneConntroler: widget.handphoneConntroler,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.emailControler.text == "" ||
                  widget.passwordControler.text == "" ||
                  widget.nameControler.text == "" ||
                  widget.grupFarmerKontroler.text == "" ||
                  widget.vilageControler.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("Please enter the data completely"),
                  ),
                );
              } else {
                ref.read(dataUserProvider.notifier).registerGrupFarmer(
                      nama: widget.nameControler.text,
                      leaderName: widget.leaderNameController.text,
                      email: widget.emailControler.text,
                      password: widget.passwordControler.text,
                      kelompok: widget.grupFarmerKontroler.text,
                      fotoUrl: File(xFile!.path),
                      village: widget.vilageControler.text,
                      familyIdentificationNumber: widget.nikControler.text,
                      mobileNumber: int.parse(widget.handphoneConntroler.text),
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
