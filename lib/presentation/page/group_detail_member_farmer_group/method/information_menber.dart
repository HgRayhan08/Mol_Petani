import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/card_information_widget.dart';

Widget informationMember(ref, UserFarmer user, width, height) => Container(
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
            information: user.village,
          ),
          CardInformationWidget(
            title: "Tanggal Lahir",
            information: user.dateOfBirth,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Email : ",
                        style: regulerReguler,
                      ),
                      Text(
                        user.email,
                        style: regulerReguler,
                      ),
                    ],
                  ),
                  user.email == ""
                      ? IconButton(
                          onPressed: () {
                            ref.read(routerProvider).goNamed(
                                "register-account-farmer",
                                extra: user);
                            // ref
                            //     .read(dataUserProvider.notifier)
                            //     .createMemberFarmerGroup(
                            //       idDocument: user.idDocument!,
                            //     );
                          },
                          icon: Icon(Icons.create))
                      : Container(),
                ],
              ),
              const Divider(),
            ],
          ),
          CardInformationWidget(
            title: "Nomor KK",
            information: user.kartuKeluarga,
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
