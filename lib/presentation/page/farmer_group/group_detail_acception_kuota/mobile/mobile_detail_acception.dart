import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/method/submission_innformation.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class MobileDetailAcception extends StatelessWidget {
  final SubmissionKuotaFertilizer data;
  final WidgetRef ref;
  const MobileDetailAcception(
      {super.key, required this.data, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, top: height * 0.015),
      children: [
        Text(
          "Information Pengiriman Pupuk",
          style: largeReguler,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        submissionInformation(width, height, data: data),
        SizedBox(
          height: height * 0.37,
        ),
        defaultTargetPlatform == TargetPlatform.iOS
            ? Container()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.06),
                    backgroundColor: blueLight),
                onPressed: () {
                  ref
                      .read(routerProvider)
                      .pushNamed("forms-acception-group", extra: data);
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
    );
  }
}
