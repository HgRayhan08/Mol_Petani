import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer/method/logic_create_farmer.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileCreateFarmer extends StatefulWidget {
  final WidgetRef ref;
  const MobileCreateFarmer({super.key, required this.ref});

  @override
  State<MobileCreateFarmer> createState() => _MobileCreateFarmerState();
}

class _MobileCreateFarmerState extends State<MobileCreateFarmer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController grupController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  String? jenisKelamin;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        top: height * 0.03,
      ),
      children: [
        Text(
          "Lengkapi Formulir Data Petani Dibawah ini",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          hinttext: "ex bagus",
          controller: nameController,
          title: "Nama",
        ),
        TextFieldCustom(
          hinttext: "Jln ex",
          controller: villageController,
          title: "Alamat",
        ),
        TextFieldCustom(
          hinttext: "No. Hp",
          controller: noHpController,
          title: "No Handphome",
        ),
        SizedBox(height: height * 0.01),

        // TextFieldCustom(
        //   hinttext: "Tangggal Lahir",
        //   controller: tanggalLahirController,
        //   title: "Tanggal Lahir",
        // ),
        TextFieldCustom(
          hinttext: "Nik",
          controller: nikController,
          title: "Nomor Induk Keluarga",
        ),

        TextFieldCustom(
          hinttext: "Luas Lahan",
          controller: luasController,
          title: "Luas Lahan Pertanian",
        ),
        SizedBox(height: height * 0.02),

        Material(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Pilih Jenis Kelamin',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: jenisKelamin,
              onChanged: (String? value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                height: height * 0.07,
                width: double.infinity,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _registrasi,
          title: "Submit",
        ),
        SizedBox(height: height * 0.05)
      ],
    );
  }

  void _registrasi() async {
    final registrasiFarmer = Registerfarmer(
        ref: widget.ref,
        context: context,
        nameController: nameController,
        villageController: villageController,
        nikController: nikController,
        noHpController: noHpController,
        luasController: luasController,
        jenisKelamin: jenisKelamin!);
    registrasiFarmer.logicCreate((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
    //   if (nameController.text == "" ||
    //       villageController.text == "" ||
    //       nikController.text == "" ||
    //       noHpController.text == "" ||
    //       kartuController.text == "" ||
    //       luasController.text == "" ||
    //       tanggalLahirController.text == "") {
    //     context.buildAlertInformation(
    //         title: "Pesan", subTitle: "Please enter the data completely");
    //   } else {
    //     context.buildAlertInformation(
    //         title: "Pesan", subTitle: "Berhasil Menambahkan Data");
    //     widget.ref.read(dataUserProvider.notifier).createFarmer(
    //           name: nameController.text,
    //           village: villageController.text,
    //           nik: nikController.text,
    //           kartuKeluarga: kartuController.text,
    //           luasLahan: luasController.text,
    //           jenisKelamin: jenisKelamin!,
    //           noHp: noHpController.text,
    //           dateOfBirth: tanggalLahirController.text,
    //         );
    //     widget.ref.read(routerProvider).goNamed("data-farmer-ppl");
    //   }
  }
}
