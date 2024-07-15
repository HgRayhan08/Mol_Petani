import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_custom.dart';
import 'package:mol_petani/presentation/widgets/list_tile_custom_widget.dart';

class MobileMonitoring extends StatelessWidget {
  final WidgetRef ref;
  const MobileMonitoring({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ref.watch(dataUserProvider.notifier).getallGrupFarmer(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return ListView.builder(
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.02,
            ),
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTileCustomWidget(
                  title: data[index].leaderName,
                  subTitle: data[index].farmerGrup,
                  image: data[index].fotoUrl.toString(),
                  width: width,
                  height: height,
                  onTap: () {
                    ref
                        .read(routerProvider)
                        .goNamed('monitoring-group', extra: data[index]);
                  });
              // return ListTileCustom(
              //   title: data[index].leaderName,
              //   subtitle: data[index].farmerGrup,
              //   image: data[index].fotoUrl.toString(),
              //   onTap: () {
              //     ref
              //         .read(routerProvider)
              //         .goNamed('monitoring-group', extra: data[index]);
              //   },
              // );
            },
          );
        }
        return const Center(
          child: Text("data Grup Farmer is null"),
        );
      },
    );
  }
}