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
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileFormSubmission extends StatefulWidget {
  final WidgetRef ref;

  const MobileFormSubmission({
    Key? key,
    required this.ref,
  }) : super(key: key);

  @override
  State<MobileFormSubmission> createState() => _MobileFormSubmissionState();
}

class _MobileFormSubmissionState extends State<MobileFormSubmission> {
  final TextEditingController tahunControler = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController villageControler = TextEditingController();
  final TextEditingController grupControler = TextEditingController();
  String? dateControler;
  final DateTime date = DateTime.now();
  final year = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        ButtonSubmissionWidget(
          onTap: _create,
          title: "Submit",
        )
      ],
    );
  }

  void _create() {
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
      widget.ref
          .read(fertilizerSubmissionProvider.notifier)
          .createSubmissionFertilizerFarmerGrup(
            namaKetua: nameControler.text,
            desa: villageControler.text,
            forYear: tahunControler.text,
            tanggal: DateFormat("dd-MM-yyyy").format(date).toString(),
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
          widget.ref.read(routerProvider).pop();
        },
      );
    }
  }
}
