// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_farmer_supporting_data/method/form_submission_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileFormSubmissionSupporting extends StatefulWidget {
  final WidgetRef ref;
  final DataSubmissionGroup data;
  final TextEditingController namaPetaniControler;
  final TextEditingController nikControler;
  final TextEditingController luasLahanControler;
  XFile? fotoKtp;
  XFile? fotoKk;
  XFile? fotoPajak;
  MobileFormSubmissionSupporting({
    Key? key,
    required this.ref,
    required this.data,
    required this.namaPetaniControler,
    required this.nikControler,
    required this.luasLahanControler,
    this.fotoKtp,
    this.fotoKk,
    this.fotoPajak,
  }) : super(key: key);

  @override
  State<MobileFormSubmissionSupporting> createState() =>
      _MobileFormSubmissionSupportingState();
}

class _MobileFormSubmissionSupportingState
    extends State<MobileFormSubmissionSupporting> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      children: [
        formSubmissionFarmer(
          context,
          nama: widget.namaPetaniControler,
          nik: widget.nikControler,
          luas: widget.luasLahanControler,
        ),
        Padding(
          padding: EdgeInsets.only(top: width * 0.03),
          child: Text(
            "Gambar Kartu Keluarga",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (widget.fotoKtp != null) {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: Text("Apakah anda yakin menghaous"),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('yes'),
                        onPressed: () async {
                          widget.fotoKtp = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              widget.fotoKtp =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(
                () {},
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: widget.fotoKtp != null
                ? Image.file(
                    File(widget.fotoKtp!.path),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Icon(Icons.add),
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: width * 0.03),
          child: Text(
            "Gambar Kartu Tanda Penganal",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (widget.fotoKk != null) {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: Text("Apakah anda yakin menghaous"),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('yes'),
                        onPressed: () async {
                          widget.fotoKk = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              widget.fotoKk =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(
                () {},
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: widget.fotoKk != null
                ? Image.file(
                    File(widget.fotoKk!.path),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Icon(Icons.add),
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: width * 0.03),
          child: Text(
            "Gambar Buku Pajak",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (widget.fotoPajak != null) {
              return showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const SingleChildScrollView(
                      child: Text("Apakah anda yakin menghaous"),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('yes'),
                        onPressed: () async {
                          widget.fotoPajak = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          setState(
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              widget.fotoPajak =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(
                () {},
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: widget.fotoPajak != null
                ? Image.file(
                    File(widget.fotoPajak!.path),
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Icon(Icons.add),
                  ),
          ),
        ),
        SizedBox(
          height: width * 0.1,
        ),
        ButtonSubmissionWidget(
          onTap: _submit,
          title: "Submition",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        )
      ],
    );
  }

  void _submit() async {
    if (widget.namaPetaniControler.text == "" ||
        widget.nikControler.text == "" ||
        widget.luasLahanControler.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else if (widget.fotoKk == null ||
        widget.fotoKtp == null ||
        widget.fotoPajak == null) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data image");
    } else {
      widget.ref
          .watch(fertilizerSubmissionProvider.notifier)
          .createSubmissionFarmer(
            idSubmmision: widget.data.idDocument.toString(),
            namaPetani: widget.namaPetaniControler.text,
            nik: widget.nikControler.text,
            luasLahan: double.parse(widget.luasLahanControler.text),
            fotoKtp: File(widget.fotoKtp!.path),
            fotoKK: File(widget.fotoKk!.path),
            fotoPajak: File(widget.fotoPajak!.path),
          );
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Berhasil Menambahkan Data");

      Future.delayed(
        const Duration(seconds: 5),
        () {
          widget.ref
              .read(routerProvider)
              .goNamed("detail-submission-grup", extra: widget.data);
        },
      );
    }
  }
}
