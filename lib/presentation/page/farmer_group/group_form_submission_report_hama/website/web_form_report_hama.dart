// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/method/dropdown_form_report_hama.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/method/form_report_hama.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';

class WebFormReportHama extends StatefulWidget {
  final WidgetRef ref;
  final TextEditingController reportingController;
  final TextEditingController detailReportingController;
  const WebFormReportHama({
    Key? key,
    required this.ref,
    required this.reportingController,
    required this.detailReportingController,
  }) : super(key: key);

  @override
  State<WebFormReportHama> createState() => _WebFormReportHamaState();
}

class _WebFormReportHamaState extends State<WebFormReportHama> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text(
          "Lengkapi Formulir Data Pelaporan Dibawah ini",
          style: extraLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        DropdownFormReportHama(
          width: width,
          height: height,
          selectedValue: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
        SizedBox(height: height * 0.02),
        formReportHama(
          widget.reportingController,
          widget.detailReportingController,
          height,
        ),
        SizedBox(height: height * 0.1),
        ElevatedButton(
          onPressed: () {
            widget.ref.read(reportProviderProvider.notifier).createReportHama(
                  reporting: widget.reportingController.text,
                  detailReporting: widget.detailReportingController.text,
                  idUserFarmer: selectedValue!,
                );
          },
          child: Text(
            "Submit",
            style: buttonReguler,
          ),
        )
      ],
    );
  }
}
