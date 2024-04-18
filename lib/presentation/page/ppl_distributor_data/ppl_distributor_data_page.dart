import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_custom.dart';

class PplDistributorDataPage extends ConsumerWidget {
  const PplDistributorDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Distributor",
          style: regulerReguler.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: ref.read(dataUserProvider.notifier).getallDistributor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // return Text("hallo");
                return ListTileCustom(
                  scope: true,
                  title: data![index].name,
                  subscope: data[index].scope,
                  image: data[index].fotoUrl.toString(),
                  onTap: () {
                    ref.read(routerProvider).goNamed(
                          "detail-distributor",
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
      floatingActionButton: IconButton(
        onPressed: () {
          ref.watch(routerProvider).goNamed("regis-distributor");
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
