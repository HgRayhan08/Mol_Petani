import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/method/form_register_distributor.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/method/logic_distributor.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_coverage_widget.dart';

class MobileCreateDistributor extends StatefulWidget {
  final WidgetRef ref;
  const MobileCreateDistributor({super.key, required this.ref});

  @override
  State<MobileCreateDistributor> createState() =>
      _MobileCreateDistributorState();
}

class _MobileCreateDistributorState extends State<MobileCreateDistributor> {
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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      "Distributor",
                      style: extraLarge.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter Distributor Data Correctly",
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
                    xfile = await ImagePicker()
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
                    child: xfile != null
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(xfile!.path)),
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
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            formRegisterDistributor(
              context,
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
            ElevatedButton(
              onPressed: _isLoading ? null : _create,
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
      ),
    );
  }

  void _create() async {
    final register = LogicDistributor(
        ref: widget.ref,
        context: context,
        emailControler: emailControler,
        passwordControler: passwordControler,
        nameControler: nameControler,
        subdistrikControler: subdistrikControler,
        nikControler: nikControler,
        handphoneConntroler: handphoneConntroler,
        tokoController: tokoController,
        xfile: xfile!,
        coverage: coverage);
    register.logicCreate(
      (isLoading) {
        setState(() {
          _isLoading = isLoading;
        });
      },
    );
    //   if (emailControler.text == "" ||
    //       passwordControler.text == "" ||
    //       nameControler.text == "" ||
    //       subdistrikControler.text == "" ||
    //       coverage == []) {
    //     context.buildAlertInformation(
    //         title: "Pesan", subTitle: "Please enter the data completely");
    //   } else {
    //     bool result =
    //         await widget.ref.read(dataUserProvider.notifier).registerDistributor(
    //               nama: nameControler.text,
    //               email: emailControler.text,
    //               password: passwordControler.text,
    //               scope: coverage,
    //               address: subdistrikControler.text,
    //               familyIdentificationNumber: nikControler.text,
    //               image: File(xfile!.path),
    //               toko: tokoController.text,
    //               mobileNumber: int.parse(handphoneConntroler.text),
    //             );
    //     setState(() {
    //       _isLoading = true;
    //     });
    //     if (result = true) {
    //       context.buildAlertInformation(
    //           title: "Pesan", subTitle: "Berhasil Menambahkan Data");
    //       Future.delayed(
    //         const Duration(seconds: 3),
    //         () {
    //           widget.ref.read(routerProvider).goNamed("data-distributor");
    //         },
    //       );
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     } else {
    //       context.buildAlertInformation(
    //           title: "Pesan", subTitle: "Gagal Menambahkan Data");
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     }
    //   }
  }
}
