import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class DistributorSendsFertilizerPage extends ConsumerStatefulWidget {
  const DistributorSendsFertilizerPage({super.key});

  @override
  ConsumerState<DistributorSendsFertilizerPage> createState() =>
      _DistributorSendsFertilizerPageState();
}

class _DistributorSendsFertilizerPageState
    extends ConsumerState<DistributorSendsFertilizerPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk Distributor",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getKuotaBaseonDistributor(
                keterangan: "Proses", informationSend: "Proses"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(width * 0.05),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTileKuotaWidget(
                  width: width,
                  title: data[index].grupFarmer,
                  subTitle: data[index].pplName,
                  year: data[index].forYear,
                  submission: data[index].submission.toString(),
                  onTap: () {
                    ref.read(routerProvider).pushNamed(
                          "detail-submission-fertilzer",
                          extra: data[index],
                        );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        // ),
      ),
    );
  }
}
