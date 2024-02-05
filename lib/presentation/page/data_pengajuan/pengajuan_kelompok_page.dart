import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class PengajuanKelompokPage extends ConsumerWidget {
  const PengajuanKelompokPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref
            .watch(dataUserProvider.notifier)
            .getPengajuan(idKelompok: "vV2QBBtTSZdkYN4byngCy1svzVz2"),
        builder: ((context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(data[index].desa),
                    Text(data[index].idDocument.toString())
                  ],
                );
              },
            );
          }
          return const Center(
            child: Text("data tidak ada"),
          );
        }),
      ),
    );
  }
}
