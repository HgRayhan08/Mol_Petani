import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/method/web_accepted.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/method/web_sender.dart';

class WebDetailMonitoringGroup extends StatelessWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  const WebDetailMonitoringGroup(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      child: Column(
        children: [
          Text(
            "Monitoring Kelompok Tani",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ketua Kelompok Tani", style: regulerReguler),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(data.leaderName),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Kelompok Tani", style: regulerReguler),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(data.nameGroupFarmer),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status: ", style: regulerReguler),
                      Container(
                        width: width * 0.22,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(data.information),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tahum", style: regulerReguler),
                      Container(
                        width: width * 0.22,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(data.year),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          const Divider(),
          SizedBox(height: height * 0.02),
          Text(
            "Detail Pengirim",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          webSender(width, height, data),
          SizedBox(height: height * 0.02),
          const Divider(),
          SizedBox(height: height * 0.02),
          Text(
            "Detail Penerimaan",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          webAccepted(width, height, data),
        ],
      ),
    );
  }
}
