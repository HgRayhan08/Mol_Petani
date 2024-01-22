import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/provider/user_data_petugas/data_user_petugas_provider.dart';

Widget informationUser(context, ref) => Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: const BoxDecoration(
            color: Color(0xff60EFB8),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                        "Hi! ${ref.watch(dataUserPetugasProvider.notifier).state.value.nama}",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        ref
                            .watch(dataUserPetugasProvider.notifier)
                            .state
                            .value
                            .keterangan,
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
                                    .watch(dataUserPetugasProvider.notifier)
                                    .state
                                    .value
                                    .fotoUrl !=
                                ""
                            ? NetworkImage(ref
                                .watch(dataUserPetugasProvider.notifier)
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
        )
      ],
    );
