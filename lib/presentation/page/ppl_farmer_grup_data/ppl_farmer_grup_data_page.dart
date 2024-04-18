import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_custom.dart';

class PplFarmerGrupDataPage extends ConsumerWidget {
  const PplFarmerGrupDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Farmer Grup Data",
          style: regulerReguler.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getallGrupFarmer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTileCustom(
                  title: data[index].name,
                  subtitle: data[index].farmerGrup,
                  image: data[index].fotoUrl.toString(),
                  onTap: () {
                    ref
                        .read(routerProvider)
                        .goNamed('detail-farmer-group', extra: data[index]);
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
      floatingActionButton: IconButton(
        onPressed: () {
          ref.read(routerProvider).pushNamed("regis-kelompok");
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
