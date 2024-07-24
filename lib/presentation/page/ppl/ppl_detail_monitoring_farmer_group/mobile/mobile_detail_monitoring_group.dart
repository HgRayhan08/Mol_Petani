import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/method/accepeted_information.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_monitoring_farmer_group/method/sender_information.dart';

class MobileDetailMonitoringGroup extends StatelessWidget {
  final WidgetRef ref;
  final SubmissionKuotaFertilizer data;
  const MobileDetailMonitoringGroup(
      {super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: blueLight,
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.03),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.leaderName,
                style: largeReguler.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "Kelompok tani ${data.nameFarmerGroup}",
                style: largeReguler.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keterangam",
                        style: smallReguler.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.information == "Send" ? "Pengiriman" : "Selesai",
                        style: regulerReguler.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.1,
                    height: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(width),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        data.send.toString(),
                        style:
                            largeReguler.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Detail Pengirim",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        senderInformation(width, height, data),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "Detail Penerimaan",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        accepetedInformation(width, height, data),
      ],
    );
  }
}
