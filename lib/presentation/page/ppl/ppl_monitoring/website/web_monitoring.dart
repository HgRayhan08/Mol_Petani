import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring/method/table_monitoring.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class WebMonitoring extends StatefulWidget {
  final WidgetRef ref;
  const WebMonitoring({super.key, required this.ref});

  @override
  State<WebMonitoring> createState() => _WebMonitoringState();
}

class _WebMonitoringState extends State<WebMonitoring> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      child: Column(
        children: [
          Text(
            "Monitoring Kelompok Tani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableMonitoring(
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
