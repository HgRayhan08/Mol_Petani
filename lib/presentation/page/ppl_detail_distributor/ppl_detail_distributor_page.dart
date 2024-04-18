import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_detail_widget.dart';

class PplDetailDistributorPage extends ConsumerWidget {
  final UserDistrubutor user;
  const PplDetailDistributorPage(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Distributor",
          style: largeReguler,
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("data-distributor");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.25,
                height: width * 0.25,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: largeReguler.copyWith(
                        // fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    user.information,
                    style: largeReguler.copyWith(
                      fontWeight: FontWeight.bold,
                      color: dark,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          ListTileDetailWidget(
            width: width,
            title: "Email",
            fill: user.email,
          ),
          ListTileDetailWidget(
            width: width,
            title: "No. Handphonne",
            fill: user.mobileNumber.toString(),
          ),
          ListTileDetailWidget(
            width: width,
            title: "Desa",
            fill: user.address,
          ),
          ListTileDetailWidget(
            width: width,
            title: "Nomor Induk Keluarga",
            fill: user.familyIdentificationNumber,
          ),
          ListTileDetailWidget(
            width: width,
            title: "Tahun DiBuat",
            fill: "2021",
          ),
          Text("Cangkupan", style: regulerReguler),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: width,
            height: width * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.25,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    color: greenLeaf,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "data",
                      style: regulerReguler.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
                // return Text(user.scope![index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
