import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class WebFormAcception extends StatelessWidget {
  final WidgetRef ref;
  final DistributionFertilizerFarmer dataFertilizer;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  final TextEditingController plantController;
  const WebFormAcception({
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
        horizontal: width * 0.08,
        vertical: height * 0.02,
      ),
      children: [
        Text("Tambah Penerimaan Pupuk",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold)),
        const Divider(),
        SizedBox(
          height: height * 0.02,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Jumlah Urea Diterima"),
          controller: ureaController,
        ),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(hintText: "Jumlah Poska Diterima"),
          controller: poskaController,
        ),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(hintText: "Jenis tanaman"),
          controller: plantController,
        ),
        SizedBox(height: height * 0.05),
        ButtonSubmissionWidget(
          onTap: () {
            ref
                .read(fertilizerSubmissionProvider.notifier)
                .updateReceptionFertilizerGroup(
                    idDocument: dataFertilizer.idDocumennt.toString(),
                    acceptUrea: int.parse(ureaController.text),
                    acceptPoska: int.parse(poskaController.text),
                    plant: plantController.text);
          },
          title: "Submit",
        ),
      ],
    );
  }
}
