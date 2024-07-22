import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_data_farmer/method/web_information_farmer.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class WebDetailDataFarmer extends StatelessWidget {
  final UserFarmer user;
  final WidgetRef ref;
  const WebDetailDataFarmer({super.key, required this.ref, required this.user});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Data Petani",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        Row(
          children: [
            webDetailFarmer(user, width, height),
            MapsWidget(
              idUserFarmer: user.idUserFarmer,
              isDelete: true,
              width: width * 0.4,
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        SizedBox(height: height * 0.03),
        user.idFarmerGroup == ""
            ? ButtonSubmissionWidget(
                title: "Tambahkan",
                onTap: () {
                  ref
                      .read(dataUserProvider.notifier)
                      .createMemberFarmerGroup(idDocument: user.idDocument!);
                },
              )
            : Container(),
      ],
    );
  }
}
