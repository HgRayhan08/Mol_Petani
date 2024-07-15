import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class MobileHistoryAccptedKuota extends StatelessWidget {
  final WidgetRef ref;
  const MobileHistoryAccptedKuota({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ref
          .read(fertilizerSubmissionProvider.notifier)
          .getHistoryDristirbutionFarmerGroup(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTileKuotaWidget(
                width: width,
                height: height,
                title: data[index].nameGroupFarmer,
                subTitle: data[index].leaderName,
                year: data[index].year,
                submission: data[index].send.toString(),
                onTap: () {
                  ref
                      .read(routerProvider)
                      .goNamed("detail-accepted-grup", extra: data[index]);
                },
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
