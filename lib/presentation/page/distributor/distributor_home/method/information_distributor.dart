import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

Widget informationDistributor(
  ref,
  width,
  height, {
  required List? scope,
}) =>
    Container(
      padding: EdgeInsets.only(
          left: width * 0.025, top: width * 0.03, bottom: width * 0.03),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 4),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: Text(
              ref.read(dataUserProvider).value!["email"].toString(),
              style: largeReguler.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.01),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      ref.read(dataUserProvider).value!["information"],
                      style: regulerReguler,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.45,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: scope!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.only(
                            right: width * 0.01,
                            top: width * 0.03,
                            bottom: width * 0.03,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02, vertical: width * 0.01),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          child: Center(
                            child: Text(
                              scope[index],
                              style: regulerReguler.copyWith(fontSize: 13),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/car.png",
                  width: width * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
