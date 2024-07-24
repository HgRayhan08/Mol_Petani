import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget informationDetailFarmer(WidgetRef ref, UserFarmer user, width, height) =>
    Container(
      padding: EdgeInsets.all(width * 0.03),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CardInformationWidget(
            title: "Alamat",
            information: user.alamat,
          ),
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Email : ",
                      style: regulerReguler,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          user.email,
                          style: regulerReguler,
                        ),
                        user.email == ""
                            ? Row(
                                children: [
                                  SizedBox(width: width * 0.58),
                                  IconButton(
                                    onPressed: () {
                                      ref.read(routerProvider).goNamed(
                                          "register-account-farmer",
                                          extra: user);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              )
                            : Container(width: 1)
                      ],
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          CardInformationWidget(
            title: "Nomor Nik",
            information: user.nik,
          ),
          CardInformationWidget(
            title: "Nomor Induk Keluarga",
            information: user.nik,
          ),
          CardInformationWidget(
            title: "Jenis Kelamin",
            information: user.jenisKelamin,
          ),
          CardInformationWidget(
            title: "Luas Lahan",
            information: user.luasLahan,
          ),
        ],
      ),
    );
