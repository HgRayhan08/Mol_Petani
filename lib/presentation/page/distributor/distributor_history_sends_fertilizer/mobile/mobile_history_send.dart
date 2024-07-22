import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class MobileHistorySend extends StatelessWidget {
  final WidgetRef ref;
  const MobileHistorySend({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
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
                  height: height,
                  width: width,
                  title: data[index].nameFarmerGroup,
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
    );
  }
}
