import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/method/table_detail_acception.dart';

class WebDetailAcception extends StatelessWidget {
  final SubmissionKuotaFertilizer data;
  final WidgetRef ref;
  const WebDetailAcception({super.key, required this.data, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Text(
          " Detail Data Penerimaan Pupuk",
          style: extraLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        tableDetailAcception(
          width: width,
          height: height,
          user: data,
        )
      ],
    );
  }
}
