import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class DistributorHistorySubissionKuotaPage extends ConsumerWidget {
  const DistributorHistorySubissionKuotaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: regulerReguler,
        ),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getKuotaBaseonDistributor(
                keterangan: "Selesai", informationSend: "Selesai"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTileKuotaWidget(
                    width: width,
                    title: data[index].grupFarmer,
                    subTitle: data[index].pplName,
                    year: data[index].forYear,
                    submission: data[index].submission.toString(),
                    onTap: () {
                      ref.read(routerProvider).pushNamed(
                            "detail-distributor-history",
                            extra: data[index],
                          );
                    },
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
