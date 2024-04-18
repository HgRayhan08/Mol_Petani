import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl_monitoring_distribusi_fertilizer/method/information.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class PplMonitoringDistribusiFertilizer extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const PplMonitoringDistribusiFertilizer(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Monitoring Pupuk",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          information(
            width,
            height,
            poska: data.poskaSubmission.toString(),
            urea: data.ureaSubmission.toString(),
            title: "Pengajuan Kuota Ke Distributor",
            onPressed: () {
              ref
                  .read(routerProvider)
                  .pushNamed("monitoring-submission-ppl", extra: data);
            },
          ),
          information(
            width,
            height,
            poska: data.poskasend.toString(),
            urea: data.ureaSend.toString(),
            title: "Pengajuan Kuota Ke Kelompok tani ",
            onPressed: () {
              ref
                  .read(routerProvider)
                  .pushNamed("monitoring-submission-group", extra: data);
            },
          ),
          information(
            width,
            height,
            poska: data.poskaReceived.toString(),
            urea: data.ureaReceived.toString(),
            title: "Kuota yang diterima Kelompok Tani",
            onPressed: () {
              ref
                  .read(routerProvider)
                  .pushNamed("monitoring-submission-distributor", extra: data);
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Keterangan",
            style: regulerReguler.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            padding: EdgeInsets.all(width * 0.03),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Distributor",
                  style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  data.distributorName,
                  style: largeReguler,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Kelompok Tani",
                    style:
                        regulerReguler.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  "kelompok ${data.grupFarmer}",
                  style: largeReguler,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Desa",
                    style:
                        regulerReguler.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  data.village,
                  style: largeReguler,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
