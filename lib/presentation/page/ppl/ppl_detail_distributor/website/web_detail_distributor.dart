import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/presentation/misc/constant.dart';

class WebDetailDistributor extends StatelessWidget {
  final UserDistrubutor user;
  const WebDetailDistributor({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      children: [
        Text(
          "Data Distributor ",
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
                        child: Text(
                          "Nama",
                          style: regulerReguler,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            ": ${user.name}",
                            style: regulerReguler,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          "Email",
                          style: regulerReguler,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            ": ${user.email}",
                            style: regulerReguler,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          "Nomor Hp",
                          style: regulerReguler,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            ": ${user.mobileNumber}",
                            style: regulerReguler,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          "Alamat",
                          style: regulerReguler,
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Text(
                            ": ${user.address}",
                            style: regulerReguler,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          "Cangkupan",
                          style: regulerReguler,
                        ),
                      ),
                      TableCell(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": ",
                              style: regulerReguler,
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: user.scope!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    "${index + 1}. ${user.scope![index]} ",
                                    style: regulerReguler,
                                  );
                                },
                              ),
                            ),
                          ],
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
                Text(
                  user.information,
                  style: regulerReguler,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
