// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/method/web_form_create_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_coverage_widget.dart';

class WebCreateDistributor extends StatefulWidget {
  final WidgetRef ref;
  const WebCreateDistributor({
    Key? key,
    required this.ref,
  }) : super(key: key);

  @override
  State<WebCreateDistributor> createState() => _WebCreateDistributorState();
}

class _WebCreateDistributorState extends State<WebCreateDistributor> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController subdistrikControler = TextEditingController();
  final TextEditingController coverageControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController handphoneConntroler = TextEditingController();
  final TextEditingController tokoController = TextEditingController();
  List<String> coverage = [];
  XFile? xfile;
  Uint8List? selectedImageInBytes;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            "Lengkapi Formulir Data Distributor Dibawah ini",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          webFormCreateDsitributor(
            context,
            width,
            height,
            key: _formKey,
            emailcontroler: emailControler,
            passwordcontroler: passwordControler,
            namecontroler: nameControler,
            subdistrikControler: subdistrikControler,
            cangkupanControler: coverageControler,
            nikControler: nikControler,
            handphoneConntroler: handphoneConntroler,
            tokoController: tokoController,
            addList: () {
              if (coverageControler.text != "") {
                coverage.add(coverageControler.text);
                coverageControler.clear();
                setState(() {});
              } else {}
            },
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
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coverage.length,
              itemBuilder: (context, index) {
                return CardCoverageWidget(
                  title: coverage[index],
                  ontap: () {
                    setState(() {
                      coverage.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          selectedImageInBytes != null
              ? Image.memory(
                  selectedImageInBytes!,
                  width: width * 0.5,
                )
              : Container(),
          SizedBox(
            height: height * 0.015,
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
                      xfile = fileResult.files.first.xFile;
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
                      vertical: height * 0.02, horizontal: width * 0.02),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _logicCreate,
                child: Text(
                  "Register",
                  style: regulerReguler.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.2, height * 0.06),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.02),
                    backgroundColor: const Color(0xff7BD3EA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: regulerReguler.copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    widget.ref.read(routerProvider).pop();
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void _logicCreate() {
    if (emailControler.text == "" ||
        passwordControler.text == "" ||
        nameControler.text == "" ||
        subdistrikControler.text == "" ||
        coverage == []) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Berhasil Menambahkan Data");
      widget.ref.read(dataUserProvider.notifier).registerDistributor(
            nama: nameControler.text,
            email: emailControler.text,
            password: passwordControler.text,
            scope: coverage,
            address: subdistrikControler.text,
            familyIdentificationNumber: nikControler.text,
            image: File(xfile!.path),
            toko: tokoController.text,
            webfotourl: selectedImageInBytes,
            mobileNumber: int.parse(
              handphoneConntroler.text,
            ),
          );
      Future.delayed(
        const Duration(seconds: 3),
        () {
          widget.ref.read(routerProvider).pop();
        },
      );
    }
  }
}
