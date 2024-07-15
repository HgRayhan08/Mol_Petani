import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_addintial.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_purpose_group.dart';

class MobileDetailSendFertilizer extends StatelessWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  const MobileDetailSendFertilizer({
    super.key,
    required this.ref,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        informationPurposeGroup(data, width, height),
        SizedBox(height: height * 0.01),
        informationAddintion(data, width),
      ],
    );
  }
}
