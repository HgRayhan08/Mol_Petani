import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/method/accepted_informatition.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_distribution_fertilizer_farmer/method/sharing_information.dart';

class MobileDetailDistribution extends StatelessWidget {
  final WidgetRef ref;
  final DistributionFertilizerFarmer data;
  const MobileDetailDistribution(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      children: [
        Text(
          "Deskripsi Pembagian Pupuk",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        sharingInformation(width, height, data),
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          "Deskripsi Pembagian Pupuk",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        acceptedInformation(width, height, data),
      ],
    );
  }
}
