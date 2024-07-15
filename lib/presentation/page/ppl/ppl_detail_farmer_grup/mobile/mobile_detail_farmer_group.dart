import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/widgets/listTile_detail_widget.dart';

class MobileDetailFarmerGroup extends StatelessWidget {
  final UserFarmerGroup user;
  const MobileDetailFarmerGroup({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(user.fotoUrl.toString()),
                    fit: BoxFit.cover),
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
                  user.leaderName,
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
          fill: user.village,
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
        ListTileDetailWidget(
          width: width,
          title: "Kelompok Tani",
          fill: user.farmerGrup,
        ),
      ],
    );
  }
}
