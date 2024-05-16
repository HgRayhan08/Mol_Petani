import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class GroupFormsDataFarmer extends ConsumerStatefulWidget {
  const GroupFormsDataFarmer({super.key});

  @override
  ConsumerState<GroupFormsDataFarmer> createState() =>
      _GroupFormsDataFarmerState();
}

class _GroupFormsDataFarmerState extends ConsumerState<GroupFormsDataFarmer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController grupController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController kartuController = TextEditingController();
  final TextEditingController luasController = TextEditingController();

  final List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  String? jenisKelamin;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambahkan Petani",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        children: [
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
            controller: nikController,
            title: "Nomor Induk Keluarga",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: grupController,
            title: "Kelompok Tani",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: kartuController,
            title: "Kartu Keluarga",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: luasController,
            title: "Luas Lahan Pertanian",
          ),
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
          SizedBox(height: height * 0.15),
          ElevatedButton(
            onPressed: _logicSubmit,
            child: Text(
              "Submit",
              style: buttonReguler.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void _logicSubmit() {
    if (nameController.text == "" ||
        villageController.text == "" ||
        nikController.text == "" ||
        grupController.text == "" ||
        kartuController.text == "" ||
        luasController.text == "") {
    } else {
      ref.read(dataUserProvider.notifier).createFarmer(
          name: nameController.text,
          village: villageController.text,
          nik: nikController.text,
          kartuKeluarga: kartuController.text,
          luasLahan: luasController.text,
          jenisKelamin: jenisKelamin!,
          noHp: '',
          dateOfBirth: '');
    }
  }
}
