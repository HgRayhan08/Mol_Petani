import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileFormAcception extends StatelessWidget {
  final WidgetRef ref;
  final DistributionFertilizerFarmer dataFertilizer;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  final TextEditingController plantController;
  const MobileFormAcception({
    Key? key,
    required this.ref,
    required this.dataFertilizer,
    required this.ureaController,
    required this.poskaController,
    required this.plantController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      children: [
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jumlah Urea",
          hinttext: "Jumlah Urea Diterima",
          controller: ureaController,
        ),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jumlah Poska",
          hinttext: "JuJumlah Poska Diterima",
          controller: poskaController,
        ),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jenis tanaman",
          hinttext: "Tanaman",
          controller: plantController,
        ),
        SizedBox(height: height * 0.1),
        ButtonSubmissionWidget(
          onTap: () {
            if (ureaController.text != "" ||
                poskaController.text != "" ||
                plantController.text != "") {
              context.buildAlertInformation(
                  title: "Pesan", subTitle: "Berhasil Menambahkan Data");
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .updateReceptionFertilizerGroup(
                      idDocument: dataFertilizer.idDocumennt.toString(),
                      acceptUrea: int.parse(ureaController.text),
                      acceptPoska: int.parse(poskaController.text),
                      plant: plantController.text);
              ref.read(routerProvider).goNamed("farmer-report");
            } else {
              context.buildAlertInformation(
                  title: "Pesan", subTitle: "Please enter the data completely");
            }
          },
          title: "Submit",
        ),
      ],
    );
  }
}
