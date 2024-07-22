// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class WebFormDistribution extends StatefulWidget {
  final WidgetRef ref;
  final UserFarmer user;
  final TextEditingController yearController;
  final TextEditingController distributionController;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  const WebFormDistribution({
    Key? key,
    required this.ref,
    required this.user,
    required this.yearController,
    required this.distributionController,
    required this.ureaController,
    required this.poskaController,
  }) : super(key: key);

  @override
  State<WebFormDistribution> createState() => _WebFormDistributionState();
}

class _WebFormDistributionState extends State<WebFormDistribution> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text(
          "Lengkapi Formulir Data Petani Dibawah ini",
          style: extraLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Tahun Distribusi",
          ),
          controller: widget.yearController,
        ),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Distribusi",
          ),
          controller: widget.distributionController,
        ),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Jumlah Urea",
          ),
          controller: widget.ureaController,
        ),
        SizedBox(height: height * 0.02),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Jumlah Poska",
          ),
          controller: widget.poskaController,
        ),
        SizedBox(height: height * 0.1),
        ButtonSubmissionWidget(
          onTap: () {
            widget.ref
                .read(fertilizerSubmissionProvider.notifier)
                .createSendFertilizerFarmer(
                  idGroupFarmer: widget.user.idFarmerGroup,
                  idUserFarmer: widget.user.idUserFarmer,
                  idPPL: widget.user.idPPL,
                  farmerName: widget.user.name,
                  year: widget.yearController.text,
                  distribution: widget.distributionController.text,
                  ureaDistribution: int.parse(widget.ureaController.text),
                  poskaDistribution: int.parse(widget.poskaController.text),
                );
          },
          title: "Submission",
        )
      ],
    );
  }
}
