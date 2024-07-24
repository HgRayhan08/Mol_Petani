// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_detail_accepted_fertilizer/method/distribution_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';

class MobileDetailAccepted extends StatelessWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  final WidgetRef ref;
  const MobileDetailAccepted({
    Key? key,
    required this.dataFertilizer,
    required this.ref,
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
        Text(
          "Penerimaan pupuk",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        distributionInformation(width, height, dataFertilizer),
        SizedBox(
          height: height * 0.45,
        ),
        dataFertilizer.information != "Selesai"
            ? ButtonSubmissionWidget(
                onTap: () {
                  ref.read(routerProvider).goNamed(
                        "form-farmer-accepted",
                        extra: dataFertilizer,
                      );
                },
                title: "Penrimaan",
              )
            : Container(),
      ],
    );
  }
}
