import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_listTile_widget.dart';

class DataDistributorPage extends ConsumerWidget {
  const DataDistributorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Distributor Data",
          style: regulerReguler.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getallDistributor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardListtileWidgets(
                  user: data![index],
                  cangkupan: true,
                );
                // return Text("data");
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
          ref.watch(routerProvider).pushNamed("regis-distributor");
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
