// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_group/method/form_grup_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class MobileFormSubmission extends StatefulWidget {
  final WidgetRef ref;
  final TextEditingController tahunControler;
  final TextEditingController nameControler;
  final TextEditingController villageControler;
  final TextEditingController grupControler;
  final String dateControler;
  final DateTime date;
  final DateTime year;
  const MobileFormSubmission({
    Key? key,
    required this.ref,
    required this.tahunControler,
    required this.nameControler,
    required this.villageControler,
    required this.grupControler,
    required this.dateControler,
    required this.date,
    required this.year,
  }) : super(key: key);

  @override
  State<MobileFormSubmission> createState() => _MobileFormSubmissionState();
}

class _MobileFormSubmissionState extends State<MobileFormSubmission> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      children: [
        submissionGrupFarmer(
          context,
          tahun: widget.tahunControler,
          name: widget.nameControler,
          grup: widget.grupControler,
          village: widget.villageControler,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateFormat("dd-mm-yy").format(widget.date)),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(widget.date.year + 5));
                if (selectDate != null) {
                  setState(() {
                    widget.date == selectDate;
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
       defaultTargetPlatform == TargetPlatform.iOS?Container():
        ElevatedButton(
          onPressed: () {
            if (widget.nameControler.text == "" ||
                widget.villageControler.text == "" ||
                widget.tahunControler.text == "" ||
                widget.grupControler.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text("Please enter the data completely"),
                ),
              );
            } else if (int.parse(widget.tahunControler.text) <=
                widget.date.year) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text("please input next year"),
                ),
              );
            } else {
              widget.ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .createSubmissionFertilizerFarmerGrup(
                    namaKetua: widget.nameControler.text,
                    desa: widget.villageControler.text,
                    forYear: widget.tahunControler.text,
                    tanggal:
                        DateFormat("dd-MM-yyyy").format(widget.date).toString(),
                    grupFarmer: widget.grupControler.text,
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
                  widget.ref.read(routerProvider).pop();
                },
              );
              // print(date.year);
            }
          },
          child: const Text("Submit"),
        )
      ],
    );
  }
}
