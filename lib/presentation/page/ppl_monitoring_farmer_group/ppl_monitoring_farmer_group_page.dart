import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class PplMonitoringFarmerGroupPage extends ConsumerWidget {
  final UserFarmerGroup user;
  const PplMonitoringFarmerGroupPage(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.farmerGrup),
      ),
      body: FutureBuilder(
        future: ref.watch(fertilizerSubmissionProvider.notifier).dataMonitoring(
              idGroupFarmer: user.uid,
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: ListTileKuotaWidget(
                    width: width,
                    title: data[index].nameGroupFarmer,
                    subTitle: data[index].information,
                    year: data[index].year,
                    submission: data[index].send.toString(),
                    onTap: () {
                      ref.read(routerProvider).goNamed(
                          "detail-monitoring-group",
                          extra: data[index]);
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
      ),
    );
  }
}
