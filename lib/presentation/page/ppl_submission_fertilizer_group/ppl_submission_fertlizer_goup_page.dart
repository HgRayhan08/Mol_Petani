import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_submission_widget.dart';

class PplSubmissionFertilizerGroupPage extends ConsumerWidget {
  const PplSubmissionFertilizerGroupPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengajuan Pupuk",
        ),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getSubmissionFarmerGroup(keterangan: "proses"),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTileSubmissionWidget(
                  title: data[index].leaderName,
                  subTitle: data[index].grupFarmer,
                  trailing: Text(
                    data[index].forYear,
                    style: regulerReguler.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    ref.watch(routerProvider).pushNamed(
                        "detail-submission-fertilizer",
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
