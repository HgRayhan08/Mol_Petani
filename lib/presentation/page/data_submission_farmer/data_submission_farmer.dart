import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/data_pengajuan_pupuk.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/data_submission_farmer/method/info_create_submission.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class DataSubmissionFarmer extends ConsumerWidget {
  final DataSubmissionFertilizer data;
  const DataSubmissionFarmer(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: blueLight,
        backgroundColor: blueLight,
        title: Text(
          "Data Submission Farmer",
          style: regulerReguler.copyWith(fontSize: 18, color: light),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoCreateSubmission(context, data),
          Expanded(
            child: FutureBuilder(
              future: ref
                  .watch(dataUserProvider.notifier)
                  .getDataSubmisiionFarmer(idKelompok: data.idDocument!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Card(
                        child: ListTile(
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
      floatingActionButton: data.keterangan != "Selesai"
          ? IconButton(
              onPressed: () {
                ref
                    .read(routerProvider)
                    .pushNamed("create-submission-farmer", extra: data);
              },
              icon: const Icon(Icons.add))
          : null,
    );
  }
}
