import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class WebCreateReport extends StatelessWidget {
  final WidgetRef ref;
  final TextEditingController judulControler;
  final TextEditingController deskripsiController;
  const WebCreateReport({
    Key? key,
    required this.ref,
    required this.judulControler,
    required this.deskripsiController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text("Buat Laporan",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold)),
        const Divider(),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          hinttext: "Judul Laporan",
          controller: judulControler,
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
        SizedBox(
          width: width,
          height: height * 0.4,
          child: TextFormField(
            controller: deskripsiController,
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
        SizedBox(
          height: height * 0.05,
        ),
        ButtonSubmissionWidget(
          onTap: () async {
            if (judulControler.text == "" || deskripsiController.text == "") {
              context.buildAlertInformation(
                  title: "Pesan",
                  subTitle: "Mohon masukkan data dengan lengkap");
            } else {
              await ref.read(reportProviderProvider.notifier).createReport(
                  reporting: judulControler.text,
                  reportingDetail: deskripsiController.text);
              ref.read(routerProvider).pop();
            }
          },
          title: "Submit",
        )
      ],
    );
  }
}
