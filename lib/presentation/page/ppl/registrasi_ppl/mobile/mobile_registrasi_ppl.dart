import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/method/form_register_ppl.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/method/logic_create.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_coverage_widget.dart';

class MobileRegistrasiPpl extends StatefulWidget {
  final WidgetRef ref;
  const MobileRegistrasiPpl({super.key, required this.ref});

  @override
  State<MobileRegistrasiPpl> createState() => _MobileRegistrasiPplState();
}

class _MobileRegistrasiPplState extends State<MobileRegistrasiPpl> {
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final TextEditingController kecamatanControler = TextEditingController();
  final TextEditingController coverageControler = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  List<String> coverage = [];
  XFile? xfile;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        top: height * 0.02,
      ),
      children: [
        Center(
          child: Image.asset(
            "assets/logo.png",
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: height * 0.015),
        Column(
          children: [
            GestureDetector(
              onTap: () async {
                xfile =
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
            ),
          ],
        ),
        formRegisterPpl(
          context,
          emailcontroler: emailControler,
          passwordcontroler: passwordControler,
          namecontroler: nameControler,
          cangkupanControler: coverageControler,
          kecamatanController: kecamatanControler,
          nikController: nikController,
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
        ButtonSubmissionWidget(
          title: "Registrasi",
          onTap: _isLoading ? null : _regsiter,
        ),
        SizedBox(height: height * 0.05)
      ],
    );
  }

  void _regsiter() {
    final create = CreatePpl(
      ref: widget.ref,
      context: context,
      nameControler: nameControler,
      emailControler: emailControler,
      passwordControler: passwordControler,
      nikController: nikController,
      coverageControler: coverageControler,
      xfile: xfile!,
      coverage: coverage,
      kecamatanControler: kecamatanControler,
    );

    create.create((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
    // if (emailControler.text != "" ||
    //     passwordControler.text != "" ||
    //     nameControler.text != "" ||
    //     coverage != []) {
    //   context.buildAlertInformation(
    //       title: "Pesan", subTitle: "Berhasil Menambahkan Data");
    // } else {
    //   context.buildAlertInformation(
    //       title: "Pesan", subTitle: "Please enter the data completely");
    //   widget.ref.read(routerProvider).goNamed("user-login");
    //   widget.ref.read(dataUserProvider.notifier).registerPpl(
    //         nama: nameControler.text,
    //         email: emailControler.text,
    //         password: passwordControler.text,
    //         subdistrict: kecamatanControler.text,
    //         image: File(xfile!.path),
    //         scope: coverage,
    //       );
    // }
  }
}
