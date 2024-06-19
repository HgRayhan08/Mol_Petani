import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_detail_accepted_fertilizer/method/distribution_information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class FarmerDetailAcceptedFertilizerPage extends ConsumerWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  const FarmerDetailAcceptedFertilizerPage(this.dataFertilizer, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Penerimaan Pupuk",
          style: largeReguler,
        ),
      ),
      body: ListView(
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
            height: height * 0.4,
          ),
          dataFertilizer.information != "Selesai"
              ? ElevatedButton(
                  onPressed: () {
                    ref.read(routerProvider).goNamed(
                          "form-farmer-accepted",
                          extra: dataFertilizer,
                        );
                  },
                  child: Text(
                    "Penrimaan",
                    style: buttonReguler,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
