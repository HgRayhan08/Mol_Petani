import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_custom.dart';

class PplCollectionSubmissionFertlizerPage extends ConsumerWidget {
  const PplCollectionSubmissionFertlizerPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengajuan Pupuk",
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getallGrupFarmer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTileCustom(
                  title: data[index].name,
                  subtitle: data[index].farmerGrup,
                  image: data[index].fotoUrl.toString(),
                  onTap: () {
                    ref.read(routerProvider).pushNamed(
                          "submission-group",
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
    );
  }
}
