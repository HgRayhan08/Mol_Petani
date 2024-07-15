import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_additional_data_fertilizer_page/methods/table_additional_data.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_farmer_supporting_data/group_form_farmer_supporting_data_page.dart';

class WebAdditionalData extends StatelessWidget {
  final DataSubmissionGroup data;
  final WidgetRef ref;
  const WebAdditionalData({super.key, required this.data, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Tambahan Pengajuan Pupuk",
                style: extraLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.01),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return GroupFormSubmissionFarmerSupportingDataPage(
                            data);
                      });
                },
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Colors.white),
                    Text(
                      "Tambah Data",
                      style: smallReguler.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableAdditionalData(
              data: data,
              ref: ref,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
