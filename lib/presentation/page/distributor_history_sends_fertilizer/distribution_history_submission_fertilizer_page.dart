import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class DistributionHistorySubmissionFertilizerPage extends ConsumerWidget {
  const DistributionHistorySubmissionFertilizerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Pengiriman",
          style: largeReguler,
        ),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getHistorydistributionFertilizerGroup(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  child: ListTileKuotaWidget(
                    width: width,
                    title: data[index].nameGroupFarmer,
                    subTitle: data[index].information,
                    year: data[index].year,
                    submission: data[index].send.toString(),
                    onTap: () {
                      ref.read(routerProvider).pushNamed(
                            "detail-send-fertilizer",
                            extra: data[index],
                          );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
