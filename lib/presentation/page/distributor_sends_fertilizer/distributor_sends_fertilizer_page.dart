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
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk Distributor",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("distributor-history-sends");
            },
            icon: const Icon(Icons.history),
          )
        ],
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
            .getdistributionFertilizerGroup(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  child: ListTileKuotaWidget(
                    width: width,
                    title: data[index].nameGroupFarmer,
                    subTitle: data[index].information,
                    year: data[index].year,
                    submission: data[index].send.toString(),
                    onTap: () {
                      ref.read(routerProvider).pushNamed(
                            "detail-send-fertilizer",
                            extra: data[index],
                          );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("forms-sends-fertilizer");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
