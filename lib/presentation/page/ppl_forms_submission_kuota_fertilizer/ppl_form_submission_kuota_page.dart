import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class PplFormsSubmissionKuotaPage extends ConsumerStatefulWidget {
  final DataSubmissionGroup dataPengajuan;
  const PplFormsSubmissionKuotaPage(this.dataPengajuan, {super.key});

  @override
  ConsumerState<PplFormsSubmissionKuotaPage> createState() =>
      _PplFormsSubmissionKuotaPageState();
}

class _PplFormsSubmissionKuotaPageState
    extends ConsumerState<PplFormsSubmissionKuotaPage> {
  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengajuan Kuota"),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getallDistributor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              children: [
                Container(
                  padding: EdgeInsets.all(width * 0.05),
                  width: width,
                  decoration: const BoxDecoration(
                    color: blueLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengajuan Kuota Pupuk ${widget.dataPengajuan.submission + 1}",
                        style: largeReguler.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        widget.dataPengajuan.leaderName,
                        style: regulerReguler.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Kelompok Tani ${widget.dataPengajuan.grupFarmer}",
                        style: regulerReguler.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Desa ${widget.dataPengajuan.village}",
                        style: regulerReguler.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.dataPengajuan.forYear,
                          style: regulerReguler.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                TextFieldCustom(
                  hinttext: "masukkan Jumlah pupuk",
                  controller: ureaControler,
                  title: "Jumlah Pupuk Urea",
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFieldCustom(
                  hinttext: "masukkan Jumlah Poska",
                  controller: poskaControler,
                  title: "Jumlah Pupuk Poska",
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Nama Distributor",
                  style: regulerReguler.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Distributor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: snapshot.data!
                        .map((e) => DropdownMenuItem<String>(
                              value: e.name,
                              child: Text(
                                e.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      selectedValue = value;
                      setState(() {});
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, height * 0.065),
                    backgroundColor: blueLight,
                  ),
                  onPressed: () {
                    if (ureaControler.text == "" || poskaControler.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text("Please enter the data completely"),
                        ),
                      );
                    } else {
                      ref
                          .watch(fertilizerSubmissionProvider.notifier)
                          .createSubmissionKuotaFertilizer(
                            idGrup: widget.dataPengajuan.idGrupFarmers,
                            idSubmission:
                                widget.dataPengajuan.idDocument.toString(),
                            leaderName: widget.dataPengajuan.leaderName,
                            distributorName: selectedValue.toString(),
                            grupFarmer: widget.dataPengajuan.grupFarmer,
                            village: widget.dataPengajuan.village,
                            submission: widget.dataPengajuan.submission,
                            urea: int.parse(ureaControler.text),
                            poska: int.parse(poskaControler.text),
                            forYear: widget.dataPengajuan.forYear,
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
                        const Duration(seconds: 3),
                        () {
                          ref.read(routerProvider).pop();
                        },
                      );
                    }
                  },
                  child: Text(
                    "Submission",
                    style: buttonReguler.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
