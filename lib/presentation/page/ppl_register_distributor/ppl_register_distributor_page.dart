import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl_register_distributor/method/form_register_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_coverage_widget.dart';

class PplRegisterDistributorPage extends ConsumerStatefulWidget {
  PplRegisterDistributorPage({super.key});
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController subdistrikControler = TextEditingController();
  final TextEditingController coverageControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController handphoneConntroler = TextEditingController();

  @override
  ConsumerState<PplRegisterDistributorPage> createState() =>
      _PplRegisterDistributorPageState();
}

class _PplRegisterDistributorPageState
    extends ConsumerState<PplRegisterDistributorPage> {
  List<String> coverage = [];
  XFile? xfile;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Distributor",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("data-distributor");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
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
                        ? Image.file(File(xfile!.path))
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
              emailcontroler: widget.emailControler,
              passwordcontroler: widget.passwordControler,
              namecontroler: widget.nameControler,
              subdistrikControler: widget.subdistrikControler,
              cangkupanControler: widget.coverageControler,
              nikControler: widget.nikControler,
              handphoneConntroler: widget.handphoneConntroler,
              addList: () {
                if (widget.coverageControler.text != "") {
                  coverage.add(widget.coverageControler.text);
                  widget.coverageControler.clear();
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
              onPressed: () {
                if (widget.emailControler.text == "" ||
                    widget.passwordControler.text == "" ||
                    widget.nameControler.text == "" ||
                    widget.subdistrikControler.text == "" ||
                    coverage == []) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Please enter the data completely"),
                    ),
                  );
                } else {
                  ref.read(dataUserProvider.notifier).registerDistributor(
                        nama: widget.nameControler.text,
                        email: widget.emailControler.text,
                        password: widget.passwordControler.text,
                        scope: coverage,
                        address: widget.subdistrikControler.text,
                        familyIdentificationNumber: '121121121',
                        image: File(xfile!.path),
                        mobileNumber: 1221212,
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
      ),
    );
  }
}
