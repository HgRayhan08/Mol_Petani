import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_fertilizer_widget.dart';

class MobileSubmissionFertilizer extends StatelessWidget {
  final WidgetRef ref;
  const MobileSubmissionFertilizer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
