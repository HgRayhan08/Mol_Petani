import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/listTile_detail_widget.dart';

class MobileDetailDistributor extends StatelessWidget {
  final UserDistrubutor user;
  const MobileDetailDistributor({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
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
                borderRadius: BorderRadius.all(
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
          fill: user.noHp.toString(),
        ),
        ListTileDetailWidget(
          width: width,
          title: "Desa",
          fill: user.alamat,
        ),
        ListTileDetailWidget(
          width: width,
          title: "Nomor Induk Keluarga",
          fill: user.nik,
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
    );
  }
}
