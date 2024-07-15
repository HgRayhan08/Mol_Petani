import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring_farmer_group/method/table_monitoring_farmer_group.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class WebMonitoringFarmerGroup extends StatefulWidget {
  final WidgetRef ref;
  final UserFarmerGroup user;
  const WebMonitoringFarmerGroup(
      {super.key, required this.ref, required this.user});

  @override
  State<WebMonitoringFarmerGroup> createState() =>
      _WebMonitoringFarmerGroupState();
}

class _WebMonitoringFarmerGroupState extends State<WebMonitoringFarmerGroup> {
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
          Text(
            "Kelola Data Distributor",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableMonitoringFarmerGroup(
              user: widget.user,
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
