import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor_forms_sends_fertilizer/methods/form_send_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class DistributorFormsSendsPage extends ConsumerStatefulWidget {
  const DistributorFormsSendsPage({super.key});

  @override
  ConsumerState<DistributorFormsSendsPage> createState() =>
      _DistributorFormsSendsPageState();
}

class _DistributorFormsSendsPageState
    extends ConsumerState<DistributorFormsSendsPage> {
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController yearControler = TextEditingController();
  final TextEditingController sendControler = TextEditingController();
  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  String? selectedValue;

  @override
  void dispose() {
    nameControler.dispose();
    yearControler.dispose();
    sendControler.dispose();
    ureaControler.dispose();
    poskaControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        children: [
          formSendFertilizer(
            width,
            height,
            name: nameControler,
            year: yearControler,
            send: sendControler,
            urea: ureaControler,
            poska: poskaControler,
          ),
          SizedBox(height: height * 0.03),
          FutureBuilder(
            future: ref
                .watch(fertilizerSubmissionProvider.notifier)
                .getallGrupFarmer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Pilih Kelompok Tani',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: snapshot.data!
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e.uid,
                            // child: Text(e.farmerGrup),
                            child: ListTile(
                              title: Text(e.farmerGrup),
                              subtitle: Text(e.name),
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      selectedValue = value;
                      setState(() {});
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: height * 0.08,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: height * 0.5,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: height * 0.08,
                      // padding: EdgeInsets.symmetric(vertical: height * 0.02)),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: const Color(0xff7BD3EA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _submission,
            child: Text(
              "Submission",
              style: buttonReguler.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    );
  }

  void _submission() async {
    if (nameControler.text != "" ||
        yearControler != 0 ||
        sendControler.text != "" ||
        ureaControler.text != "" ||
        poskaControler.text != "") {
      await ref
          .read(fertilizerSubmissionProvider.notifier)
          .createSendFertilizerGroup(
            idGroupFarmer: selectedValue.toString(),
            nameDistributor: nameControler.text,
            year: yearControler.text,
            send: int.parse(sendControler.text),
            sendUrea: int.parse(ureaControler.text),
            sendPoska: int.parse(poskaControler.text),
          );
      await context.buildAlertInformation();
      await Future.delayed(const Duration(seconds: 2), () {
        ref.read(routerProvider).pop();
      });
      ref.read(routerProvider).pop();
    } else {}
  }
}
