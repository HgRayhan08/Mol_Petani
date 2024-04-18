import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/process_submission_widget.dart';

class GroupDetailSubmissionFertilizerGroupPage extends ConsumerWidget {
  final DataSubmissionGroup data;
  const GroupDetailSubmissionFertilizerGroupPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pengajuan"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 15,
            ),
            decoration: const BoxDecoration(
              color: blueLight,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                ProcessSubmissionWidget(
                  submission: data.submission,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.leaderName,
                          style: largeReguler.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(data.grupFarmer,
                            style: largeReguler.copyWith(
                                color: Colors.white, fontSize: 18)),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Desa ${data.village}",
                          style: largeReguler.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Pengajuan Tahun",
                          style: smallReguler.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          data.forYear,
                          style: largeReguler.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data Petani",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: dark,
                  thickness: 1,
                  height: 5,
                  endIndent: width * 0.3,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: ref
                .watch(fertilizerSubmissionProvider.notifier)
                .getDataSubmisiionFarmer(
                  idKelompok: data.idDocument.toString(),
                ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var pengajuan = snapshot.data!;
                      return ListTileSubmissionWidget(
                        title: pengajuan[index].namaPetani,
                        subTitle: pengajuan[index].nik,
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          ref.read(routerProvider).pushNamed(
                              "detail-supporting-grup",
                              extra: pengajuan[index]);
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Text("Kosong");
              }
            },
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          ref
              .read(routerProvider)
              .goNamed("create-submission-farmer", extra: data);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
