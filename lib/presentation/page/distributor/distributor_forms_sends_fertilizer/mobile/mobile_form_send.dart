// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/methods/form_send_fertilizer.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/methods/logic_send.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

// ignore: must_be_immutable
class MobileFormSend extends StatefulWidget {
  final WidgetRef ref;
  final TextEditingController nameControler;
  final TextEditingController yearControler;
  final TextEditingController sendControler;
  final TextEditingController ureaControler;
  final TextEditingController poskaControler;
  String? selectedValue;
  MobileFormSend({
    Key? key,
    required this.ref,
    required this.nameControler,
    required this.yearControler,
    required this.sendControler,
    required this.ureaControler,
    required this.poskaControler,
    this.selectedValue,
  }) : super(key: key);

  @override
  State<MobileFormSend> createState() => _MobileFormSendState();
}

class _MobileFormSendState extends State<MobileFormSend> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      children: [
        formSendFertilizer(
          width,
          height,
          name: widget.nameControler,
          year: widget.yearControler,
          send: widget.sendControler,
          urea: widget.ureaControler,
          poska: widget.poskaControler,
        ),
        SizedBox(height: height * 0.03),
        Material(
          child: FutureBuilder(
            future: widget.ref
                .watch(fertilizerSubmissionProvider.notifier)
                .getallGrupFarmer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Material(
                  child: DropdownButtonHideUnderline(
                    child: Material(
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
                                child: Material(
                                  child: ListTile(
                                    title: Text(e.farmerGrup),
                                    subtitle: Text(e.leaderName),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: widget.selectedValue,
                        onChanged: (String? value) {
                          widget.selectedValue = value;
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
        ),
        SizedBox(
          height: height * 0.03,
        ),
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _submission,
          title: "Submission",
        ),
        SizedBox(
          height: height * 0.05,
        ),
      ],
    );
  }

  void _submission() async {
    final create = LogicSend(
        ref: widget.ref,
        context: context,
        selectedValue: widget.selectedValue.toString(),
        nameControler: widget.nameControler,
        yearControler: widget.yearControler,
        sendControler: widget.sendControler,
        ureaControler: widget.ureaControler,
        poskaControler: widget.poskaControler);
    create.create((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
