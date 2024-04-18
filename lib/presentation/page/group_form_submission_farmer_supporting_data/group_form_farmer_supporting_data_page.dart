import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_form_submission_farmer_supporting_data/method/form_submission_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class GroupFormSubmissionFarmerSupportingDataPage
    extends ConsumerStatefulWidget {
  final DataSubmissionGroup data;

  const GroupFormSubmissionFarmerSupportingDataPage(this.data, {super.key});
  @override
  ConsumerState<GroupFormSubmissionFarmerSupportingDataPage> createState() =>
      _GroupFormSubmissionFarmerSupportingDataPageState();
}

class _GroupFormSubmissionFarmerSupportingDataPageState
    extends ConsumerState<GroupFormSubmissionFarmerSupportingDataPage> {
  final TextEditingController namaPetaniControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController luasLahanControler = TextEditingController();
  XFile? fotoKtp;
  XFile? fotoKk;
  XFile? fotoPajak;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       ref
        //           .read(routerProvider)
        //           .goNamed("detail-submission-grup", extra: widget.data);
        //     },
        //     icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Create Submission Fertilizer",
          style: regulerReguler.copyWith(fontSize: 18),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        children: [
          formSubmissionFarmer(
            context,
            nama: namaPetaniControler,
            nik: nikControler,
            luas: luasLahanControler,
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
              if (fotoKtp != null) {
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
                            fotoKtp = await ImagePicker()
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
                fotoKtp =
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
              child: fotoKtp != null
                  ? Image.file(
                      File(fotoKtp!.path),
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
              if (fotoKk != null) {
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
                            fotoKk = await ImagePicker()
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
                fotoKk =
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
              child: fotoKk != null
                  ? Image.file(
                      File(fotoKk!.path),
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
              if (fotoPajak != null) {
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
                            fotoPajak = await ImagePicker()
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
                fotoPajak =
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
              child: fotoPajak != null
                  ? Image.file(
                      File(fotoPajak!.path),
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
          ElevatedButton(
            onPressed: () async {
              if (namaPetaniControler.text == "" ||
                  nikControler.text == "" ||
                  luasLahanControler.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("Please enter the data completely"),
                  ),
                );
              } else if (fotoKk == null ||
                  fotoKtp == null ||
                  fotoPajak == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("Please enter the data image"),
                  ),
                );
              } else {
                ref
                    .watch(fertilizerSubmissionProvider.notifier)
                    .createSubmissionFarmer(
                      idSubmmision: widget.data.idDocument.toString(),
                      namaPetani: namaPetaniControler.text,
                      nik: nikControler.text,
                      luasLahan: double.parse(luasLahanControler.text),
                      fotoKtp: File(fotoKtp!.path),
                      fotoKK: File(fotoKk!.path),
                      fotoPajak: File(fotoPajak!.path),
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
                    ref.read(routerProvider).goNamed("detail-submission-grup");
                  },
                );
              }
            },
            child: Text(
              "Submition",
              style: buttonReguler,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}
