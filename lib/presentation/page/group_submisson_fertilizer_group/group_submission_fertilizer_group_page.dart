import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_fertilizer_widget.dart';

class GroupSubmissionFertilizerGroup extends ConsumerWidget {
  const GroupSubmissionFertilizerGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Pupuk",
          style: largeReguler.copyWith(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.03),
            child: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("history-submission-grup");
              },
              icon: const Icon(
                Icons.history,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getSubmissionFertilizerFarmerGrup(keterangan: "proses"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTileFertilizer(
                  data: data[index],
                  onTap: () {
                    ref.read(routerProvider).goNamed(
                          "detail-submission-grup",
                          extra: data[index],
                        );
                  },
                );
              },
            );
          }
          return const Center(
            child: Text("data Grup Farmer is null"),
          );
        },
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: blueLight,
          borderRadius: BorderRadius.all(
            Radius.circular(
              100,
            ),
          ),
        ),
        child: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("create-submission-grup");
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
