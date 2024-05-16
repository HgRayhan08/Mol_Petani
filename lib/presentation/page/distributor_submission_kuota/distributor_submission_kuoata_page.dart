import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_kuota_widget.dart';

class DistributorSubmissionKuotaPage extends ConsumerStatefulWidget {
  const DistributorSubmissionKuotaPage({super.key});

  @override
  ConsumerState<DistributorSubmissionKuotaPage> createState() =>
      _DistributorSubmissionKuotaPageState();
}

class _DistributorSubmissionKuotaPageState
    extends ConsumerState<DistributorSubmissionKuotaPage> {
  // final RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  // void _onRefresh() async {
  //   // monitor network fetch
  //   await ref
  //       .watch(fertilizerSubmissionProvider.notifier)
  //       .getKuotaBaseonDistributor(keterangan: "");
  //   _refreshController.refreshCompleted();
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Pupuk Distributor",
          style: regulerReguler,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: IconButton(
              onPressed: () {
                ref.read(routerProvider).pushNamed("distributor-history-kuota");
              },
              icon: Icon(
                Icons.history,
                size: width * 0.08,
              ),
            ),
          ),
        ],
      ),
      body:
          // SmartRefresher(
          //   controller: _refreshController,
          //   onRefresh: _onRefresh,
          //   child:
          FutureBuilder(
        future: ref
            .watch(fertilizerSubmissionProvider.notifier)
            .getKuotaBaseonDistributor(keterangan: "", informationSend: ""),
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
