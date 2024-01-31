import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

AppBar informationUser(context, ref) => AppBar(
      backgroundColor: blueLight,
      title: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          "assets/logo2.png",
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
      bottom: PreferredSize(
        preferredSize:
            Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi! ${ref.watch(dataUserProvider.notifier).state.value.nama}",
                        style: extraLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: light,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3))
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          ref
                              .watch(dataUserProvider.notifier)
                              .state
                              .value
                              .keterangan,
                          style: regulerReguler.copyWith(color: dark),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: ref
                                    .watch(dataUserProvider.notifier)
                                    .state
                                    .value
                                    .fotoUrl !=
                                ""
                            ? NetworkImage(ref
                                .watch(dataUserProvider.notifier)
                                .state
                                .value
                                .fotoUrl) as ImageProvider
                            : const AssetImage(
                                ("assets/user.png"),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
