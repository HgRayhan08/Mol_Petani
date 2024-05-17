// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/all_home_page/method/informasi_submission.dart';
import 'package:mol_petani/presentation/page/all_home_page/method/information_distributor.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/news_widget.dart';

class HomeDistributorPage extends ConsumerWidget {
  const HomeDistributorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: width * 0.4,
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, top: height * 0.01),
        children: [
          Row(
            children: [
              Container(
                width: width * 0.16,
                height: width * 0.16,
                margin: EdgeInsets.only(right: width * 0.03),
                decoration: BoxDecoration(
                  color: blueLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
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
              Text(
                "Hi ${ref.read(dataUserProvider).value!["name"]}",
                style: extraLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          informationDistributor(
            ref,
            width,
            height,
            scope: ref.read(dataUserProvider).value!["scope"],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          informationOrderFertilizer(
            context,
            ref,
            width,
            height,
            dataOrder: ref
                .watch(fertilizerSubmissionProvider.notifier)
                .getKuotaBaseonDistributor(keterangan: "", informationSend: ""),
            dataSend: ref
                .watch(fertilizerSubmissionProvider.notifier)
                .getKuotaBaseonDistributor(
                    keterangan: "Proses", informationSend: "Proses"),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            height: height * 0.7,
            child: const NewsWidget(
              amounnt: 3,
            ),
          ),
        ],
      ),
    );
  }
}
