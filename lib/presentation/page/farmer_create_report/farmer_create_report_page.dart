import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class FarmerCreateReportPage extends ConsumerStatefulWidget {
  const FarmerCreateReportPage({super.key});

  @override
  ConsumerState<FarmerCreateReportPage> createState() =>
      _FarmerCreateReportPageState();
}

class _FarmerCreateReportPageState
    extends ConsumerState<FarmerCreateReportPage> {
  TextEditingController judulControler = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  void dispose() {
    judulControler.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Membuat Laporan",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.05),
        children: [
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
          Container(
            width: width,
            height: height * 0.4,
            // decoration: BoxDecoration(
            //   border: Border.all(),
            // ),
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
            height: height * 0.22,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(reportProviderProvider.notifier).createReport(
                  reporting: judulControler.text,
                  reportingDetail: deskripsiController.text);
              // ref.read(routerProvider).pop();
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
