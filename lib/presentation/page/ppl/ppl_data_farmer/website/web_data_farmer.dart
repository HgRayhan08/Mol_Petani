import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_data_farmer/method/table_data_farmer.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_register_farmer/ppl_register_farmer_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class WebDataFarmer extends StatefulWidget {
  final WidgetRef ref;
  const WebDataFarmer({super.key, required this.ref});

  @override
  State<WebDataFarmer> createState() => _WebDataFarmerState();
}

class _WebDataFarmerState extends State<WebDataFarmer> {
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
                "Kelola Data Petani",
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
                        child: const PplRegisterFarmer(),
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
            child: TableDataFarmer(
              ref: widget.ref,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
    // return ListView(
    //   padding: EdgeInsets.only(
    //       bottom: height * 0.01,
    //       top: height * 0.05,
    //       left: width * 0.02,
    //       right: width * 0.02),
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           "Kelola Kelompok Tani",
    //           style: extraLarge.copyWith(fontWeight: FontWeight.bold),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             ref.read(routerProvider).pushNamed("regis-farmer");
    //           },
    //           style: ElevatedButton.styleFrom(
    //             padding: EdgeInsets.symmetric(
    //                 vertical: height * 0.02, horizontal: width * 0.01),
    //             backgroundColor: const Color(0xff7BD3EA),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //           child: Row(
    //             children: [
    //               const Icon(Icons.add, color: Colors.white),
    //               Text(
    //                 "Tambah Data",
    //                 style: smallReguler.copyWith(color: Colors.white),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //     SizedBox(height: height * 0.02),
    //     FutureBuilder(
    //       future: ref.watch(dataUserProvider.notifier).getFarmer(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           var data = snapshot.data!;
    //           return TableFarmer(
    //             data: data,
    //             ref: ref,
    //             height: height,
    //             width: width,
    //           );
    //         } else {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //       },
    //     ),
    //   ],
    // );
  }
}
