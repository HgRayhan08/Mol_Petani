import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_create_report/method/logic_create.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileCreateReport extends StatefulWidget {
  final WidgetRef ref;
  final TextEditingController judulControler;
  final TextEditingController deskripsiController;
  const MobileCreateReport({
    Key? key,
    required this.ref,
    required this.judulControler,
    required this.deskripsiController,
  }) : super(key: key);

  @override
  State<MobileCreateReport> createState() => _MobileCreateReportState();
}

class _MobileCreateReportState extends State<MobileCreateReport> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.all(width * 0.05),
      children: [
        TextFieldCustom(
          hinttext: "Judul Laporan",
          controller: widget.judulControler,
          title: "Laporan",
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          "Deskripsi",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: width,
          height: height * 0.4,
          child: Material(
            child: TextFormField(
              controller: widget.deskripsiController,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                hintText: 'Enter a message',
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.22,
        ),
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _create,
          // onTap: () async {
          //   if (judulControler.text != "" || deskripsiController.text != "") {
          //     context.buildAlertInformation(
          //         title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          //     await ref.read(reportProviderProvider.notifier).createReport(
          //         reporting: judulControler.text,
          //         reportingDetail: deskripsiController.text);
          //     ref.read(routerProvider).goNamed("farmer-report");
          //   } else {
          //     context.buildAlertInformation(
          //         title: "Pesan", subTitle: "Please enter the data completely");
          //   }
          // },
          title: "Submit",
        )
      ],
    );
  }

  void _create() {
    final create = LogicCreateReport(
        ref: widget.ref,
        context: context,
        judulControler: widget.judulControler,
        deskripsiController: widget.deskripsiController);

    create.create((isLoading) {
      _isLoading = isLoading;
    });
  }
}
