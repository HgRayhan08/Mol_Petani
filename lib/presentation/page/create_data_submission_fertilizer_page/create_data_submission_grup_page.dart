import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/create_data_submission_fertilizer_page/method/form_submission_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_upload_file_widget.dart';
import 'package:mol_petani/presentation/widgets/show_dialog_widget.dart';

class CreateDataSubmissionFertilizerGrup extends ConsumerStatefulWidget {
  final DataSubmissionFertilizer data;

  const CreateDataSubmissionFertilizerGrup(this.data, {super.key});
  @override
  ConsumerState<CreateDataSubmissionFertilizerGrup> createState() =>
      _CreateDataSubmissionFertilizerGrupState();
}

class _CreateDataSubmissionFertilizerGrupState
    extends ConsumerState<CreateDataSubmissionFertilizerGrup> {
  final TextEditingController namaPetaniControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController luasLahanControler = TextEditingController();
  String? fotoKtp;
  String? fotoKk;
  String? fotoPajak;
  XFile? xfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          CardUploadFileWidget(
            xfile: xfile,
            image: fotoKk,
            title: "Gambar Kartu Keluarga",
            func: () async {
              var hallo = await showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return ShowDialogWidget(xfile: xfile);
                },
              );
              fotoKk = hallo;
              setState(() {});
            },
          ),
          CardUploadFileWidget(
            xfile: xfile,
            image: fotoKtp,
            title: "Gambar KTP",
            func: () async {
              var hallo = await showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return ShowDialogWidget(xfile: xfile);
                },
              );
              fotoKtp = hallo;
              setState(() {});
            },
          ),
          CardUploadFileWidget(
            xfile: xfile,
            image: fotoPajak,
            title: "Gambar Buku Pajak",
            func: () async {
              var hallo = await showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return ShowDialogWidget(xfile: xfile);
                },
              );
              fotoPajak = hallo;
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () async {
              // print(fotoKk);

              await ref.watch(dataUserProvider.notifier).createSubmissionFarmer(
                    idSubmmision: widget.data.idDocument.toString(),
                    namaPetani: namaPetaniControler.text,
                    nik: nikControler.text,
                    luasLahan: double.parse(luasLahanControler.text),
                    fotoKtp: fotoKtp!,
                    fotoKK: fotoKk!,
                    fotoPajak: fotoPajak!,
                  );
              ref.read(routerProvider).pop();
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
