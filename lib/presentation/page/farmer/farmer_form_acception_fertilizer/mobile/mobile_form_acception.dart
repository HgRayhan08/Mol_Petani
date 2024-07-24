import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_form_acception_fertilizer/method/logic_create_acception.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileFormAcception extends StatefulWidget {
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
  State<MobileFormAcception> createState() => _MobileFormAcceptionState();
}

class _MobileFormAcceptionState extends State<MobileFormAcception> {
  bool _isLoading = false;
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
        Text(
          "Penerimaan Pupuk",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jumlah Urea",
          hinttext: "Jumlah Urea Diterima",
          controller: widget.ureaController,
        ),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jumlah Poska",
          hinttext: "Jumlah Poska Diterima",
          controller: widget.poskaController,
        ),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          title: "Jenis tanaman",
          hinttext: "Tanaman",
          controller: widget.plantController,
        ),
        SizedBox(height: height * 0.4),
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _create,
          // onTap: () {
          //   if (widget.ureaController.text != "" ||
          //       widget.poskaController.text != "" ||
          //       widget.plantController.text != "") {
          //     context.buildAlertInformation(
          //         title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          //     widget.ref
          //         .read(fertilizerSubmissionProvider.notifier)
          //         .updateReceptionFertilizerGroup(
          //             idDocument: widget.dataFertilizer.idDocumennt.toString(),
          //             acceptUrea: int.parse(widget.ureaController.text),
          //             acceptPoska: int.parse(widget.poskaController.text),
          //             plant: widget.plantController.text);
          //     widget.ref.read(routerProvider).goNamed("farmer-report");
          //   } else {
          //     context.buildAlertInformation(
          //         title: "Pesan", subTitle: "Please enter the data completely");
          //   }
          // },
          title: "Submit",
        ),
      ],
    );
  }

  void _create() {
    final create = LogicAcception(
        ref: widget.ref,
        context: context,
        ureaController: widget.ureaController,
        poskaController: widget.poskaController,
        plantController: widget.plantController,
        dataFertilizer: widget.dataFertilizer);
    create.create((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
