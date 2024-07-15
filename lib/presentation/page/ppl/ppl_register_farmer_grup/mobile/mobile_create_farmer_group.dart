import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer_grup/method/form_register_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MobileCreateFarmerGroup extends StatefulWidget {
  final WidgetRef ref;
  const MobileCreateFarmerGroup({super.key, required this.ref});

  @override
  State<MobileCreateFarmerGroup> createState() =>
      _MobileCreateFarmerGroupState();
}

class _MobileCreateFarmerGroupState extends State<MobileCreateFarmerGroup> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController leaderNameController = TextEditingController();
  final TextEditingController grupFarmerKontroler = TextEditingController();
  final TextEditingController vilageControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController handphoneConntroler = TextEditingController();
  XFile? xFile;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
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
                xFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
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
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(xFile!.path)),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      )
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
          emailcontroler: emailControler,
          passwordcontroler: passwordControler,
          leadernameController: leaderNameController,
          grupcontroler: grupFarmerKontroler,
          vilagecontroler: vilageControler,
          nikControler: nikControler,
          handphoneConntroler: handphoneConntroler,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        ElevatedButton(
          onPressed: _logicCreate,
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
    );
  }

  void _logicCreate() {
    if (emailControler.text == "" ||
        passwordControler.text == "" ||
        grupFarmerKontroler.text == "" ||
        vilageControler.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Berhasil Menambahkan Data");
      widget.ref.read(dataUserProvider.notifier).registerGrupFarmer(
            leaderName: leaderNameController.text,
            email: emailControler.text,
            password: passwordControler.text,
            kelompok: grupFarmerKontroler.text,
            fotoUrl: File(xFile!.path),
            village: vilageControler.text,
            familyIdentificationNumber: nikControler.text,
            mobileNumber: int.parse(handphoneConntroler.text),
          );

      Future.delayed(
        const Duration(seconds: 5),
        () {
          widget.ref.read(routerProvider).goNamed("data-grup-farmer");
        },
      );
    }
  }
}
