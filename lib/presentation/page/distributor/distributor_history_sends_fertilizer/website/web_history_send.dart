import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_history_sends_fertilizer/method/table_history_send.dart';

class WebHistorySend extends StatefulWidget {
  final WidgetRef ref;
  const WebHistorySend({super.key, required this.ref});

  @override
  State<WebHistorySend> createState() => _WebHistorySendState();
}

class _WebHistorySendState extends State<WebHistorySend> {
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
            "History Pengiriman Pupuk",
            style: extraLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableHistorySendFertilizer(
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
