import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_history_pest_report/method/table_history_pest.dart';

class WebHistoryPest extends StatefulWidget {
  final WidgetRef ref;
  const WebHistoryPest({super.key, required this.ref});

  @override
  State<WebHistoryPest> createState() => _WebHistoryPestState();
}

class _WebHistoryPestState extends State<WebHistoryPest> {
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
            "laporan Hama Kelompok Tani",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableHistoryPest(
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
