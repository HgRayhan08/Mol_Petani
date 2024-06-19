import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_farmer_widget.dart';
import 'package:mol_petani/presentation/widgets/search_widget.dart';

class PplDataFarmer extends ConsumerWidget {
  const PplDataFarmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Petani",
          style: regulerReguler.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ref.watch(dataUserProvider.notifier).getFarmer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return Column(
              children: [
                SearchWidget(
                  width: width,
                  onTap: () {},
                ),
                Divider(
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTileFarmerWidget(
                        width: width,
                        height: height,
                        data: data[index],
                        onTap: () {
                          ref.read(routerProvider).pushNamed(
                                "ppl-detail-farmer",
                                extra: data[index],
                              );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: IconButton(
      //   onPressed: () {
      //     ref.read(routerProvider).pushNamed("forms-farmer");
      //   },
      //   icon: const Icon(Icons.add),
      // ),
    );
  }
}
