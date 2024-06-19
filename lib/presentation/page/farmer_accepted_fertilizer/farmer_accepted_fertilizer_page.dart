import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class FarmerAcceptedFertilizerpage extends ConsumerWidget {
  const FarmerAcceptedFertilizerpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Peneriamaan Pupuk", style: largeReguler),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getAcceptFertilizerFarmer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      ref.read(routerProvider).goNamed("farmer-detail-accepted",
                          extra: data[index]);
                    },
                    leading: Text(
                      data[index].year,
                      style: regulerReguler.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      data[index].farmerName,
                      style: regulerReguler,
                    ),
                    subtitle: Text(
                      data[index].distribusiDate,
                      style: regulerReguler,
                    ),
                    trailing: Text(
                      data[index].information == "Distribution"
                          ? "Pembagian"
                          : "Selesai",
                      style: smallReguler,
                    ),
                  ),
                );
              },
            );
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
