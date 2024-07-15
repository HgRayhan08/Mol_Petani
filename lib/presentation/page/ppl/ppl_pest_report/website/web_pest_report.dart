import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_pest_report/method/table_pest_report.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class WebPestReport extends StatefulWidget {
  final WidgetRef ref;
  const WebPestReport({super.key, required this.ref});

  @override
  State<WebPestReport> createState() => _WebPestReportState();
}

class _WebPestReportState extends State<WebPestReport> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "laporan Hama Kelompok Tani",
                style: extraLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () async {
                  widget.ref
                      .read(routerProvider)
                      .goNamed("ppl-history-pest-reporting");
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
                      "History",
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
            child: TablePestReport(
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
