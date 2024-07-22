import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_home/method/information_distributor.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/news_widget.dart';

class MobileHomeDistributor extends StatelessWidget {
  final WidgetRef ref;
  const MobileHomeDistributor({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
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
        Container(
          margin: EdgeInsets.only(top: height * 0.01),
          height: height * 0.7,
          child: const NewsWidget(
            amounnt: 3,
            routes: "main-dist",
          ),
        ),
      ],
    );
  }
}
