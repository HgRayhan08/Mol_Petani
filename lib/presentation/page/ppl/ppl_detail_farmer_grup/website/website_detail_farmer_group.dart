import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class WebsiteDetailFarmerGroup extends StatelessWidget {
  final UserFarmerGroup user;
  const WebsiteDetailFarmerGroup({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      children: [
        Text(
          "Data Kelompok Tani",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(height: height * 0.02),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: width * 0.3,
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(width * 0.06),
                  1: FixedColumnWidth(width * 0.06),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text("Nama Ketua"),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(": ${user.leaderName}"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text("Nama Kelompok Tani"),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(": ${user.farmerGrup}"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text("Email"),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(": ${user.email}"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text("Nomor Hp"),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(": ${user.mobileNumber}"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text("Alamat"),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(": ${user.village}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(0), // Membuat kotak
                  ),
                  child: ClipRect(
                    child: Image.network(
                      user.fotoUrl!,
                      width: width * 0.15,
                      height: width * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(user.information),
              ],
            )
          ],
        ),
      ],
    );
  }
}
