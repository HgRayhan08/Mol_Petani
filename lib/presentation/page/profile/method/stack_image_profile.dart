import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

Widget stackImageProfile(ref, width, height) => SizedBox(
      height: height * 0.16,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height * 0.1,
            width: width,
            color: blueLight,
          ),
          Positioned(
            top: height * 0.04,
            child: Container(
              width: width * 0.25,
              height: width * 0.25,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: ref
                //               .watch(dataUserProvider.notifier)
                //               .state
                //               .value!["fotoUrl"] !=
                //           ""
                //       ? NetworkImage(
                //           ref
                //               .watch(dataUserProvider.notifier)
                //               .state
                //               .value!["fotoUrl"],
                //         ) as ImageProvider
                //       : const AssetImage(
                //           ("assets/user.png"),
                //         ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
