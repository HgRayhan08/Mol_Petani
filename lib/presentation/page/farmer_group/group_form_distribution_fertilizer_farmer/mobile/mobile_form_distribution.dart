// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileFormDistribution extends StatefulWidget {
  final WidgetRef ref;
  final UserFarmer user;
  final TextEditingController yearController;
  final TextEditingController distributionController;
  final TextEditingController ureaController;
  final TextEditingController poskaController;
  const MobileFormDistribution({
    Key? key,
    required this.ref,
    required this.user,
    required this.yearController,
    required this.distributionController,
    required this.ureaController,
    required this.poskaController,
  }) : super(key: key);

  @override
  State<MobileFormDistribution> createState() => _MobileFormDistributionState();
}

class _MobileFormDistributionState extends State<MobileFormDistribution> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Material(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          TextFieldCustom(
            title: "Tahun",
            hinttext: "Tahun Distribusi",
            controller: widget.yearController,
          ),
          SizedBox(height: height * 0.02),
          TextFieldCustom(
            title: "Distribusi",
            hinttext: "Distribusi",
            controller: widget.distributionController,
          ),
          SizedBox(height: height * 0.02),
          TextFieldCustom(
            title: "Urea",
            hinttext: "Jumlah Urea",
            controller: widget.ureaController,
          ),
          SizedBox(height: height * 0.02),
          TextFieldCustom(
            title: "Poska",
            hinttext: "Jumlah Poska",
            controller: widget.poskaController,
          ),
          SizedBox(height: height * 0.1),
          defaultTargetPlatform == TargetPlatform.iOS
              ? Container()
              : ButtonSubmissionWidget(
                  onTap: () {
                    if (widget.distributionController.text == "" ||
                        widget.poskaController.text == "" ||
                        widget.ureaController.text == "") {
                      context.buildAlertInformation(
                          title: "Pesan",
                          subTitle: "Please enter the data completely");
                    } else {
                      context.buildAlertInformation(
                          title: "Pesan",
                          subTitle: "Berhasil Menambahkan Data");
                      widget.ref
                          .read(fertilizerSubmissionProvider.notifier)
                          .createSendFertilizerFarmer(
                            idGroupFarmer: widget.user.idFarmerGroup,
                            idUserFarmer: widget.user.idUserFarmer,
                            idPPL: widget.user.idPPL,
                            farmerName: widget.user.name,
                            year: widget.yearController.text,
                            distribution: widget.distributionController.text,
                            ureaDistribution:
                                int.parse(widget.ureaController.text),
                            poskaDistribution:
                                int.parse(widget.poskaController.text),
                          );
                      Future.delayed(
                        const Duration(seconds: 3),
                        () {
                          widget.ref.read(routerProvider).pop();
                        },
                      );
                    }
                  },
                  title: "Submission",
                )
        ],
      ),
    );
  }
}
