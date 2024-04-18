import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/presentation/page/group_form_submission_group/method/form_grup_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class GroupFormSubmissionGroupPage extends ConsumerStatefulWidget {
  const GroupFormSubmissionGroupPage({super.key});

  @override
  ConsumerState<GroupFormSubmissionGroupPage> createState() =>
      _GroupFormSubmissionGroupPageState();
}

class _GroupFormSubmissionGroupPageState
    extends ConsumerState<GroupFormSubmissionGroupPage> {
  final TextEditingController tahunControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController villageControler = TextEditingController();
  final TextEditingController grupControler = TextEditingController();
  XFile? xfile;
  String? dateControler;
  final DateTime date = DateTime.now();
  final year = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Submission Vertilizer",
          style: regulerReguler.copyWith(fontSize: 18),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        children: [
          submissionGrupFarmer(
            context,
            tahun: tahunControler,
            name: nameControler,
            grup: grupControler,
            village: villageControler,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat("dd-mm-yy").format(date)),
              TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(date.year + 5));
                  if (selectDate != null) {
                    setState(() {
                      date == selectDate;
                    });
                  }
                },
                child: const Text("Date"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              if (nameControler.text == "" ||
                  villageControler.text == "" ||
                  tahunControler.text == "" ||
                  grupControler.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("Please enter the data completely"),
                  ),
                );
              } else if (int.parse(tahunControler.text) <= date.year) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text("please input next year"),
                  ),
                );
              } else {
                ref
                    .read(fertilizerSubmissionProvider.notifier)
                    .createSubmissionFertilizerFarmerGrup(
                      namaKetua: nameControler.text,
                      desa: villageControler.text,
                      forYear: tahunControler.text,
                      tanggal: date.toString(),
                      grupFarmer: grupControler.text,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: light,
                    duration: const Duration(seconds: 4),
                    content: Text(
                      "Create Submission is Succes",
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
                // print(date.year);
              }
            },
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}



      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: GestureDetector(
      //         onTap: () async {
      //           xfile =
      //               await ImagePicker().pickImage(source: ImageSource.gallery);
      //           setState(() {});
      //         },
      //         child: CircleAvatar(
      //           radius: 100,
      //           backgroundImage:
      //               xfile != null ? FileImage(File(xfile!.path)) : null,
      //           child: xfile != null ? null : const Icon(Icons.add),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 30,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         ref
      //             .watch(dataUserProvider.notifier)
      //             .uploadImage(imageFile: File(xfile!.path));
      //       },
      //       child: const Text("Upload Image"),
      //     )
      //   ],
      // ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       ref.read(dataUserProvider.notifier).createPengajuanPupuk(
      //             namaKetua: "kelompok Sukoiber",
      //             desa: "sukoiber",
      //             forYear: "2025",
      //             tanggal: "24-01-2024",
      //             grupFarmer: 'iber-iber',
      //           );
      //     },
      //     child: const Text("create"),
      //   ),
      // ),