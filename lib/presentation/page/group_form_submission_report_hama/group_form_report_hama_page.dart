import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_form_submission_report_hama/method/dropdown_form_report_hama.dart';
import 'package:mol_petani/presentation/page/group_form_submission_report_hama/method/form_report_hama.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';

class GroupFormReportHamaPage extends ConsumerStatefulWidget {
  const GroupFormReportHamaPage({super.key});

  @override
  ConsumerState<GroupFormReportHamaPage> createState() =>
      _GroupFormReportHamaPageState();
}

class _GroupFormReportHamaPageState
    extends ConsumerState<GroupFormReportHamaPage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final TextEditingController reportingController = TextEditingController();
    final TextEditingController detailReportingController =
        TextEditingController();

    @override
    void dispose() {
      reportingController.dispose();
      detailReportingController.dispose();
      super.dispose();
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pelaporan Hama',
          style: largeReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
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
            reportingController,
            detailReportingController,
            height,
          ),
          SizedBox(height: height * 0.38),
          ElevatedButton(
            onPressed: () {
              ref.read(reportProviderProvider.notifier).createReportHama(
                    reporting: reportingController.text,
                    detailReporting: detailReportingController.text,
                    idUserFarmer: selectedValue!,
                  );
            },
            child: Text(
              "Submit",
              style: buttonReguler,
            ),
          )
        ],
      ),
    );
  }
}
