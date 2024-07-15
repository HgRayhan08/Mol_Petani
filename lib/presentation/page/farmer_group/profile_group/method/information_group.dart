import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

Widget informationGroup(ref) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ref.read(dataUserProvider.notifier).state.value!["leaderName"],
          style: largeReguler,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(
            color: dark,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            ref.read(dataUserProvider.notifier).state.value!["information"],
            style: regulerReguler.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
