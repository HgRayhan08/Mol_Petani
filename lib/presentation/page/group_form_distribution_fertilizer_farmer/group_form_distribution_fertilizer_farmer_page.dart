import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class GroupFormDistributionFertilizerFarmerPage extends ConsumerStatefulWidget {
  final UserFarmer user;
  const GroupFormDistributionFertilizerFarmerPage(this.user, {super.key});

  @override
  ConsumerState<GroupFormDistributionFertilizerFarmerPage> createState() =>
      _GroupFormDistributionFertilizerFarmerPageState();
}

class _GroupFormDistributionFertilizerFarmerPageState
    extends ConsumerState<GroupFormDistributionFertilizerFarmerPage> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController distributionController = TextEditingController();
  final TextEditingController ureaController = TextEditingController();
  final TextEditingController poskaController = TextEditingController();

  @override
  void dispose() {
    yearController.dispose();
    distributionController.dispose();
    ureaController.dispose();
    poskaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembagian Pupuk", style: largeReguler),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Tahun Distribusi",
            ),
            controller: yearController,
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Distribusi",
            ),
            controller: distributionController,
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Jumlah Urea",
            ),
            controller: ureaController,
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Jumlah Poska",
            ),
            controller: poskaController,
          ),
          SizedBox(height: height * 0.1),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(fertilizerSubmissionProvider.notifier)
                  .createSendFertilizerFarmer(
                    idGroupFarmer: widget.user.idGrupFarmer,
                    idUserFarmer: widget.user.idUserFarmer,
                    idPPL: widget.user.idPPL,
                    farmerName: widget.user.name,
                    year: yearController.text,
                    distribution: distributionController.text,
                    ureaDistribution: int.parse(ureaController.text),
                    poskaDistribution: int.parse(poskaController.text),
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
