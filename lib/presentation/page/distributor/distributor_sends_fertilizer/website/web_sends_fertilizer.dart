import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_forms_sends_fertilizer/distributor_forms_sends_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_sends_fertilizer/method/table_sends_fertilizer.dart';

class WebSendsFertilizer extends StatefulWidget {
  final WidgetRef ref;
  const WebSendsFertilizer({super.key, required this.ref});

  @override
  State<WebSendsFertilizer> createState() => _WebSendsFertilizerState();
}

class _WebSendsFertilizerState extends State<WebSendsFertilizer> {
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
                "Data Pengiriman",
                style: extraLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.02,
                  ),
                  backgroundColor: const Color(0xff7BD3EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Dialog(
                        child: DistributorFormsSendsPage(),
                      );
                    },
                  );
                  setState(() {});
                },
                child: Text(
                  "Tambah",
                  style: buttonReguler.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          const Divider(),
          SizedBox(height: height * 0.02),
          Expanded(
            child: TableSendsFertilizer(
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
