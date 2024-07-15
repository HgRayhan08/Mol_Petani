import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_pest_report/method/information_pest_report.dart';

class MobileDetailPest extends StatelessWidget {
  final WidgetRef ref;
  final PestReport data;
  const MobileDetailPest({super.key, required this.ref, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        defaultTargetPlatform == TargetPlatform.iOS
            ? Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                decoration: const BoxDecoration(
                    color: blueLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.nameFarmerGroup,
                      style: largeReguler.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Keterangan : ${data.information}",
                      style: regulerReguler.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            : Container(),
        Text("Detail", style: regulerReguler),
        informationPestReport(data, width),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
