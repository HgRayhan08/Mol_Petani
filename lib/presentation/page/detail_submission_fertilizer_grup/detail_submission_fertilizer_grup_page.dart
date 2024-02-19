import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class DetailSubmissionFertilizerGrupPage extends ConsumerWidget {
  final String id;
  const DetailSubmissionFertilizerGrupPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
              future: ref
                  .watch(dataUserProvider.notifier)
                  .getDataSubmisiionFarmer(idKelompok: id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            ref.read(routerProvider).pushNamed(
                                "detail-fertilizer-farmer",
                                extra: data);
                          },
                          title: Text(
                            data.namaPetani,
                            style: regulerReguler,
                          ),
                          subtitle: Text(
                            data.nik,
                            style: regulerReguler,
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("error"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
