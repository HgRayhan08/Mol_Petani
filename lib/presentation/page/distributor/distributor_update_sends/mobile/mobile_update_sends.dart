import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileUpdateSends extends StatelessWidget {
  final WidgetRef ref;
  final String idDocument;
  MobileUpdateSends({super.key, required this.ref, required this.idDocument});

  final TextEditingController sendController = TextEditingController();
  final TextEditingController ureaController = TextEditingController();
  final TextEditingController poskaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      children: [
        TextFieldCustom(
          hinttext: "Pengiriman",
          title: "Pengiriman",
          controller: sendController,
        ),
        TextFieldCustom(
          hinttext: "Urea",
          title: "Jumlah Urea",
          controller: ureaController,
        ),
        TextFieldCustom(
          hinttext: "Poska",
          title: "Jumlah Poska",
          controller: poskaController,
        ),
        SizedBox(height: height * 0.1),
        ButtonSubmissionWidget(
          onTap: () {
            if (sendController.text != "" ||
                ureaController.text != "" ||
                poskaController.text != "") {
              context.buildAlertInformation(
                  title: "Pesan", subTitle: "Berhasil Menambahkan Data");
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .updateSendFertilizer(
                      send: int.parse(sendController.text),
                      sendUrea: int.parse(ureaController.text),
                      sendPoska: int.parse(poskaController.text),
                      idDocument: idDocument);
            } else {
              context.buildAlertInformation(
                  title: "Pesan",
                  subTitle: "Tolong lengkapi data Dengan Benar");
            }
          },
          title: "Submit",
        ),
      ],
    );
  }
}
