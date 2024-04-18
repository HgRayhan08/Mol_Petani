import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class GroupFormsReceivedPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  GroupFormsReceivedPage(this.data, {super.key});

  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  final TextEditingController namaControler = TextEditingController();
  final TextEditingController senderName = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penerimaan Pupuk",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          TextFieldCustom(
            hinttext: "Nama Pengirim",
            controller: senderName,
            title: "Nama Pengirim",
          ),
          TextFieldCustom(
            hinttext: "Nama Penerima",
            controller: namaControler,
            title: "Nama Pengirim",
          ),
          TextFieldCustom(
            hinttext: "Urea",
            controller: ureaControler,
            title: "Pupuk Urea",
          ),
          TextFieldCustom(
            hinttext: "Poska",
            controller: poskaControler,
            title: "Pupuk Poska",
          ),
          SizedBox(
            height: height * 0.35,
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .updateAcceptedGroup(
                    idDocument: data.idDocument.toString(),
                    poskaReceived: int.parse(poskaControler.text),
                    ureaReceived: int.parse(ureaControler.text),
                    sendName: senderName.text,
                    recipientName: namaControler.text,
                  );
            },
            child: Text(
              "Submission",
              style: buttonReguler,
            ),
          )
        ],
      ),
    );
  }
}
