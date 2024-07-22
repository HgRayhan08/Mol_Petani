import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class MobileMonitoringFarmerGroup extends StatelessWidget {
  final WidgetRef ref;
  final UserFarmerGroup user;
  const MobileMonitoringFarmerGroup(
      {super.key, required this.ref, required this.user});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ref.watch(fertilizerSubmissionProvider.notifier).dataMonitoring(
            idGroupFarmer: user.uid,
          ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: ListTileKuotaWidget(
                  width: width,
                  height: height,
                  title: data[index].nameFarmerGroup,
                  subTitle: data[index].information,
                  year: data[index].year,
                  submission: data[index].send.toString(),
                  onTap: () {
                    ref.read(routerProvider).goNamed(
                      "detail-monitoring-group",
                      extra: {
                        "data": data[index],
                        "user": user,
                      },
                    );
                  },
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
