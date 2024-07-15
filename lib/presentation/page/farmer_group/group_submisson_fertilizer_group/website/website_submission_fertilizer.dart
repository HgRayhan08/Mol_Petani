import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_group/group_form_submission_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/method/tabtel_submission_fertilzier.dart';

class WebsiteSubmissionFertilizer extends StatefulWidget {
  final WidgetRef ref;
  const WebsiteSubmissionFertilizer({super.key, required this.ref});

  @override
  State<WebsiteSubmissionFertilizer> createState() =>
      _WebsiteSubmissionFertilizerState();
}

class _WebsiteSubmissionFertilizerState
    extends State<WebsiteSubmissionFertilizer> {
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
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pengajuan Pupuk Kelompok Tani",
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
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const GroupFormSubmissionGroupPage(),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: Text(
                    "Tambah",
                    style: smallReguler.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: height * 0.03),
          Expanded(
            child: TableSubmissionFertilizer(
              ref: widget.ref,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
