import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_distributor_data/method/table_distributor_data.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_distributor/ppl_register_distributor_page.dart';

class WebDataDistributor extends StatefulWidget {
  final WidgetRef ref;
  const WebDataDistributor({super.key, required this.ref});

  @override
  State<WebDataDistributor> createState() => _WebDataDistributorState();
}

class _WebDataDistributorState extends State<WebDataDistributor> {
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
                "Kelola Data Distributor",
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
                        child: const PplRegisterDistributorPage(),
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
            child: TableDistributionData(
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
