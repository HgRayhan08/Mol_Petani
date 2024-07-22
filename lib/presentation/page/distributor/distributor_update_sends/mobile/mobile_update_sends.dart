import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_update_sends/method/update_send.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileUpdateSends extends StatefulWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  const MobileUpdateSends({super.key, required this.ref, required this.data});

  @override
  State<MobileUpdateSends> createState() => _MobileUpdateSendsState();
}

class _MobileUpdateSendsState extends State<MobileUpdateSends> {
  final TextEditingController sendController = TextEditingController();
  final TextEditingController ureaController = TextEditingController();
  final TextEditingController poskaController = TextEditingController();
  bool _isLoading = false;

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
          onTap: _isLoading ? null : _update,
          title: "Submit",
        ),
      ],
    );
  }

  void _update() {
    final updateLogic = UpdateSendFertilizer(
        ref: widget.ref,
        context: context,
        sendController: sendController,
        ureaController: ureaController,
        poskaController: poskaController,
        data: widget.data);

    updateLogic.update((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
