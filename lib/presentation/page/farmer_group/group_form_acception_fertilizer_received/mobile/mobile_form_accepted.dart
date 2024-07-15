import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileFormAccepted extends StatelessWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  final TextEditingController ureaControler;
  final TextEditingController poskaControler;
  final TextEditingController namaControler;
  final TextEditingController senderName;
  const MobileFormAccepted({
    super.key,
    required this.ref,
    required this.data,
    required this.namaControler,
    required this.poskaControler,
    required this.senderName,
    required this.ureaControler,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          hinttext: "Nama Pengirim",
          controller: senderName,
          title: "Nama Pengirim",
        ),
        TextFieldCustom(
          hinttext: "Nama Penerima",
          controller: namaControler,
          title: "Nama Penerima",
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
        defaultTargetPlatform == TargetPlatform.iOS ?Container():
        ElevatedButton(
          onPressed: () {
            ref
                .read(fertilizerSubmissionProvider.notifier)
                .updateAcceptionFertilizerGroup(
                  idDocument: data.idDocument.toString(),
                  acceptPoska: int.parse(poskaControler.text),
                  acceptUrea: int.parse(ureaControler.text),
                  nameSendDistributor: senderName.text,
                  nameAcceptGroupFarmer: namaControler.text,
                );
          },
          child: Text(
            "Submission",
            style: buttonReguler,
          ),
        )
      ],
    );
  }
}
