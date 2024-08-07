import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_detail_accepted_kuota/method/kuota_information_group.dart';
import 'package:mol_petani/presentation/page/group_detail_accepted_kuota/method/submission_innformation.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class GroupDetailAcceptedKuotaPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const GroupDetailAcceptedKuotaPage(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pengiriman Pupuk",
          style: regulerReguler,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, top: height * 0.015),
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Information Pengiriman Pupuk",
            style: regulerReguler,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          submissionInformation(width, height, data: data),
          SizedBox(
            height: height * 0.32,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(width, height * 0.06),
                backgroundColor: blueLight),
            onPressed: () {
              ref
                  .read(routerProvider)
                  .pushNamed("forms-receiver-group", extra: data);
            },
            child: Text(
              "Penerimaaan",
              style: buttonReguler.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
