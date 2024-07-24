import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class MobileAcceptedFertilizer extends StatelessWidget {
  final WidgetRef ref;
  const MobileAcceptedFertilizer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
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
                  color: Colors.amber,
                  border: Border(
                    bottom: BorderSide(),
                  ),
                ),
                child: Material(
                  child: ListTile(
                    tileColor: background,
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
    );
  }
}
