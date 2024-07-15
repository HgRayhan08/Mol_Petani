import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

AppBar informationFarmer(ref, width, height) => AppBar(
      backgroundColor: blueLight,
      title: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          "assets/logo2.png",
          height: 35,
          fit: BoxFit.contain,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, height * 0.13),
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: 0,
            bottom: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang!",
                    style: regulerReguler.copyWith(
                        fontWeight: FontWeight.bold, color: light),
                  ),
                ],
              ),
              Text(
                ref.watch(dataUserProvider.notifier).state.value!["name"],
                style: extraLarge.copyWith(
                    fontWeight: FontWeight.bold, color: light),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: width * 0.01),
                  decoration: const BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Kelompok Tani ${ref.read(dataUserProvider.notifier).state.value!["grupFarmer"]}",
                    style: regulerReguler,
                  ),
                ),
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
