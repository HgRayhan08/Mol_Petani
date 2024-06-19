import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_detail_distribution_fertilizer_farmer/method/accepted_informatition.dart';
import 'package:mol_petani/presentation/page/group_detail_distribution_fertilizer_farmer/method/sharing_information.dart';

class GroupDetailDistributionFertilizerFarmerPage extends ConsumerWidget {
  final DistributionFertilizerFarmer data;
  const GroupDetailDistributionFertilizerFarmerPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.farmerName),
      ),
      body: ListView(
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
