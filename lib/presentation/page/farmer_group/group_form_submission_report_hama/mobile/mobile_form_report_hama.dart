import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/method/dropdown_form_report_hama.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/method/form_report_hama.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_report_hama/method/logic_report.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileFormReportHama extends StatefulWidget {
  final WidgetRef ref;
  final TextEditingController reportingController;
  final TextEditingController detailReportingController;
  final String? selectedValue;
  final ValueChanged<String?>? onValueChanged;

  const MobileFormReportHama({
    super.key,
    required this.ref,
    required this.reportingController,
    required this.detailReportingController,
    this.selectedValue,
    this.onValueChanged,
  });

  @override
  State<MobileFormReportHama> createState() => _MobileFormReportHamaState();
}

class _MobileFormReportHamaState extends State<MobileFormReportHama> {
  String? _selectedValue;
  final TextEditingController reportingController = TextEditingController();
  final TextEditingController detailReportingController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(height: height * 0.02),
        DropdownFormReportHama(
          width: width,
          height: height,
          selectedValue: _selectedValue,
          onChanged: (String? value) {
            setState(() {
              _selectedValue = value;
            });
            if (widget.onValueChanged != null) {
              widget.onValueChanged!(value);
            }
          },
        ),
        SizedBox(height: height * 0.02),
        formReportHama(
          reportingController,
          detailReportingController,
          height,
        ),
        SizedBox(height: height * 0.38),
        defaultTargetPlatform == TargetPlatform.iOS
            ? Container()
            : ButtonSubmissionWidget(
                onTap: _isLoading ? null : _create,
                title: "Submit",
              )
      ],
    );
  }

  void _create() {
    final create = LogicReport(
        ref: widget.ref,
        context: context,
        reportingController: reportingController,
        detailReportingController: detailReportingController,
        selectedValue: _selectedValue.toString());
    create.create((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
