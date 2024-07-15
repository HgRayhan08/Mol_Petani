import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer_grup/method/web_form_create_farmer_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class WebCreateFarmerGroup extends StatefulWidget {
  final WidgetRef ref;
  const WebCreateFarmerGroup({super.key, required this.ref});

  @override
  State<WebCreateFarmerGroup> createState() => _WebCreateFarmerGroupState();
}

class _WebCreateFarmerGroupState extends State<WebCreateFarmerGroup> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController leaderNameController = TextEditingController();
  final TextEditingController grupFarmerKontroler = TextEditingController();
  final TextEditingController vilageControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController handphoneConntroler = TextEditingController();
  XFile? xFile;
  Uint8List? selectedImageInBytes;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.07,
        right: width * 0.07,
        top: height * 0.02,
        bottom: height * 0.07,
      ),
      child: ListView(
        children: [
          Text(
            "Lengkapi Formulir Data Kelompok Tani Dibawah ini",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          webFormCreateFarmerGroup(
            width,
            height,
            key: _formKey,
            emailcontroler: emailControler,
            passwordcontroler: passwordControler,
            leadernameController: leaderNameController,
            grupcontroler: grupFarmerKontroler,
            vilagecontroler: vilageControler,
            nikControler: nikControler,
            handphoneConntroler: handphoneConntroler,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    FilePickerResult? fileResult =
                        await FilePicker.platform.pickFiles();
                    if (fileResult != null) {
                      selectedImageInBytes = fileResult.files.first.bytes;
                      xFile = fileResult.files.first.xFile;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "Pilih File",
                    style: smallReguler.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(width: width * 0.02),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.2, height * 0.06),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width * 0.05),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _logicCreate,
                child: Text(
                  "Registrasi",
                  style: regulerReguler.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.2, height * 0.06),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width * 0.05),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  widget.ref.read(routerProvider).pop();
                },
                child: Text(
                  "Cancel",
                  style: regulerReguler.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _logicCreate() {
    if (_formKey.currentState!.validate()) {
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
              webfotourl: selectedImageInBytes,
            );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            widget.ref.read(routerProvider).pop();
            setState(() {});
          },
        );
      }
    }
  }
}
