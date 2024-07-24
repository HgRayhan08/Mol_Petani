// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/method/form_register_ppl.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/method/logic_create.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/method/web_form.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets_tidak/card_coverage_widget.dart';

class WebRegistrasi extends StatefulWidget {
  final WidgetRef ref;
  final double width;
  final double height;
  const WebRegistrasi({
    Key? key,
    required this.ref,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<WebRegistrasi> createState() => _WebRegistrasiState();
}

class _WebRegistrasiState extends State<WebRegistrasi> {
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
    return ListView(
      padding: EdgeInsets.only(
        left: widget.width * 0.05,
        right: widget.width * 0.05,
        top: widget.height * 0.02,
      ),
      children: [
        Row(
          children: [
            Text(
              "Registrasi",
              style: extraLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const VerticalDivider(
              width: 20,
              thickness: 2,
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              "Penyuluh Pertanian Lapangan",
              style: extraLarge.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: widget.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                xfile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: widget.height * 0.01),
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
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
        webForm(
          context,
          width: widget.width,
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
        SizedBox(height: widget.height * 0.05)
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
  }
}
