import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_listTile_widget.dart';

class SubmissionDataFertilizerGrup extends ConsumerWidget {
  const SubmissionDataFertilizerGrup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Submission Grup",
          style: largeReguler.copyWith(),
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getallGrupFarmer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardListtileWidgets(
                  user: data![index],
                  trailing: true,
                  rounded: 50,
                  ontap: () {
                    ref.read(routerProvider).pushNamed("all-submission-grup",
                        extra: data[index].uid);
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
    );
  }
}
