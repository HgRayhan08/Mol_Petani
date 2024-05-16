import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class PplDetailMonitorinngFertilizerPage extends ConsumerWidget {
  const PplDetailMonitorinngFertilizerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Monitoring Pupuk",
          style: regulerReguler,
        ),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getKuotaFertilizer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!;
                return ListTileKuotaWidget(
                  width: width,
                  title: data[index].leaderName,
                  subTitle: data[index].distributorName,
                  year: data[index].forYear,
                  submission: data[index].submission.toString(),
                  onTap: () {
                    ref.read(routerProvider).pushNamed(
                        "monitoring-distribusi-fertilizer",
                        extra: data[index]);
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
      ),
    );
  }
}
