import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_submission_fertilizer_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AllSubmissionFertilizerGrup extends ConsumerWidget {
  final String id;
  const AllSubmissionFertilizerGrup(this.id, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: FutureBuilder(
        future: ref
            .watch(dataUserProvider.notifier)
            .getPengajuan(keterangan: "Pengajuan", uid: id),
        builder: ((context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: light,
                  child: ListTile(
                    onTap: () {
                      ref.read(routerProvider).pushNamed(
                          "detail-submission-fertilizer-grup",
                          extra: data[index].idDocument);
                    },
                    title: Text(data[index].leaderName),
                    subtitle: Text(data[index].forYear),
                    trailing: CircularPercentIndicator(
                      radius: 25,
                      percent:
                          ((double.parse(data[index].pengajuan) * 0.1) * 3) +
                              0.099,
                      center: Text(
                        " Ke ${data[index].pengajuan}",
                        style: smallReguler,
                      ),
                      progressColor: blueInfo,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
