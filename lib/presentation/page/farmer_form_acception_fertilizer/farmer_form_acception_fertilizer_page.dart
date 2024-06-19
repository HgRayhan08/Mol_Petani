import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class FarmerFormAcceptionFertilizerPage extends ConsumerStatefulWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  const FarmerFormAcceptionFertilizerPage(this.dataFertilizer, {super.key});

  @override
  ConsumerState<FarmerFormAcceptionFertilizerPage> createState() =>
      _FarmerFormAcceptionFertilizerPageState();
}

class _FarmerFormAcceptionFertilizerPageState
    extends ConsumerState<FarmerFormAcceptionFertilizerPage> {
  TextEditingController ureaController = TextEditingController();
  TextEditingController poskaController = TextEditingController();
  TextEditingController plantController = TextEditingController();
  @override
  void dispose() {
    ureaController.dispose();
    poskaController.dispose();
    plantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Penerimaan",
          style: largeReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Jumlah Urea Diterima"),
            controller: ureaController,
          ),
          TextFormField(
            decoration:
                const InputDecoration(hintText: "Jumlah Poska Diterima"),
            controller: poskaController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Jenis tanaman"),
            controller: plantController,
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .updateSendFertilizerGroup(
                      idDocument: widget.dataFertilizer.idDocumennt.toString(),
                      acceptUrea: int.parse(ureaController.text),
                      acceptPoska: int.parse(poskaController.text),
                      plant: plantController.text);
            },
            child: Text(
              "Submit",
              style: buttonReguler,
            ),
          ),
        ],
      ),
    );
  }
}
