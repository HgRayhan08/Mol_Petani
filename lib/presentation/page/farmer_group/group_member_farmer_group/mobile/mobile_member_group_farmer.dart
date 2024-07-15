import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_farmer_widget.dart';

class MobileMemberGroupFarmer extends StatelessWidget {
  final WidgetRef ref;
  const MobileMemberGroupFarmer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ref.watch(dataUserProvider.notifier).getMemberFarmerGroup(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTileFarmerWidget(
                width: width,
                height: height,
                data: data[index],
                onTap: () {
                  ref.read(routerProvider).pushNamed(
                        "detail-member-group",
                        extra: data[index],
                      );
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
