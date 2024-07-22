import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

Widget informationUserPpl(context, ref) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi! ${ref.watch(dataUserProvider.notifier).state.value!["name"]}",
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
                        .value!["information"],
                    style: regulerReguler.copyWith(color: dark),
                  ),
                )
              ],
            ),
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ref
                              .watch(dataUserProvider.notifier)
                              .state
                              .value!["fotoUrl"] !=
                          ""
                      ? NetworkImage(
                          ref
                              .watch(dataUserProvider.notifier)
                              .state
                              .value!["fotoUrl"],
                        ) as ImageProvider
                      : const AssetImage(
                          ("assets/user.png"),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
