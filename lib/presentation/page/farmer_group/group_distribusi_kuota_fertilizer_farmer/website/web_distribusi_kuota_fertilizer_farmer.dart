import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribusi_kuota_fertilizer_farmer/method/table_distribution_kuota_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_distribution_fertilizer_farmer/group_form_distribution_fertilizer_farmer_page.dart';

class WebDistributionKuotaFertilizerFarmer extends StatefulWidget {
  final WidgetRef ref;
  final UserFarmer user;
  const WebDistributionKuotaFertilizerFarmer({
    super.key,
    required this.ref,
    required this.user,
  });

  @override
  State<WebDistributionKuotaFertilizerFarmer> createState() =>
      _WebDistributionKuotaFertilizerFarmerState();
}

class _WebDistributionKuotaFertilizerFarmerState
    extends State<WebDistributionKuotaFertilizerFarmer> {
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
                "Data Perolehan Pupuk Petani",
                style: extraLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: GroupFormDistributionFertilizerFarmerPage(
                            widget.user),
                      );
                    },
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.01),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
            child: TableDistributionKuotaFertilizerFarmer(
              ref: widget.ref,
              width: width,
              height: height,
              user: widget.user,
            ),
          ),
        ],
      ),
    );
  }
}
