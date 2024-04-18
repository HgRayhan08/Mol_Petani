import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class DistributorFormsSendsPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  DistributorFormsSendsPage(this.data, {super.key});

  final TextEditingController sendsControler = TextEditingController();
  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  final TextEditingController recipientControler = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          TextFieldCustom(
            hinttext: "",
            controller: sendsControler,
            title: "Nama Pengirim",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: recipientControler,
            title: "Nama penerima",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: ureaControler,
            title: "Pupuk Urea",
          ),
          TextFieldCustom(
            hinttext: "",
            controller: poskaControler,
            title: "Pupuk Poska",
          ),
          SizedBox(
            height: height * 0.4,
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .updateSendFertilizer(
                    idDocument: data.idDocument.toString(),
                    ureaSend: int.parse(ureaControler.text),
                    poskaSend: int.parse(poskaControler.text),
                    sendName: sendsControler.text,
                    recipientName: recipientControler.text,
                  );
            },
            child: Text(
              "Submit",
              style: buttonReguler.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
