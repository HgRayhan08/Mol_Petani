import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class WebCreateFarmer extends StatefulWidget {
  final WidgetRef ref;
  const WebCreateFarmer({super.key, required this.ref});

  @override
  State<WebCreateFarmer> createState() => _WebCreateFarmerState();
}

class _WebCreateFarmerState extends State<WebCreateFarmer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController grupController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController kartuController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  String? jenisKelamin;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.01,
        vertical: height * 0.03,
      ),
      child: ListView(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        children: [
          Text(
            "Lengkapi Formulir Data Petani Dibawah ini",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          TextFieldCustom(
            hinttext: "ex bagus",
            controller: nameController,
            title: "Nama",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: villageController,
            title: "Alamat",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: noHpController,
            title: "No Handphome",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.22,
                hinttext: "",
                controller: tanggalLahirController,
                title: "Tanggal Lahir",
              ),
              TextFieldCustom(
                width: width * 0.22,
                hinttext: "",
                controller: nikController,
                title: "Nomor Induk Keluarga",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldCustom(
                width: width * 0.22,
                hinttext: "",
                controller: kartuController,
                title: "Kartu Keluarga",
              ),
              TextFieldCustom(
                width: width * 0.22,
                hinttext: "",
                controller: luasController,
                title: "Luas Lahan Pertanian",
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          DropdownButtonHideUnderline(
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
          SizedBox(height: height * 0.03),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.ref.read(routerProvider).pop();
                },
                child: Text(
                  "Cancel",
                  style: buttonReguler.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: _logicSubmit,
                child: Text(
                  "Submit",
                  style: buttonReguler.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _logicSubmit() {
    if (nameController.text == "" ||
        villageController.text == "" ||
        nikController.text == "" ||
        noHpController.text == "" ||
        kartuController.text == "" ||
        luasController.text == "") {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Berhasil Menambahkan Data");
      widget.ref.read(dataUserProvider.notifier).createFarmer(
            name: nameController.text,
            village: villageController.text,
            nik: nikController.text,
            luasLahan: luasController.text,
            jenisKelamin: jenisKelamin!,
            noHp: noHpController.text,
          );
      // context.buildAlertInformation();
      widget.ref.read(routerProvider).pop();
    }
  }
}
