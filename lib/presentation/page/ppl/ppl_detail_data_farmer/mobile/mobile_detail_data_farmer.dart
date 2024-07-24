import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_data_farmer/method/information_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class MobileDetailDataFarmer extends StatelessWidget {
  final WidgetRef ref;
  final UserFarmer user;
  const MobileDetailDataFarmer(
      {super.key, required this.ref, required this.user});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        bottom: height * 0.1,
      ),
      child: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Data Diri",
            style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
          ),
          informationFarmer(user, width, height),
          SizedBox(height: height * 0.01),
          Text(
            "Lokasi Sawah",
            style: regulerReguler,
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: MapsWidget(
              idUserFarmer: user.idUserFarmer,
              width: width * 0.75,
            ),
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: ButtonSubmissionWidget(
              title: "Tambah Lokasi Sawah",
              onTap: () {
                ref
                    .read(routerProvider)
                    .pushNamed("ppl-form-maps", extra: user);
              },
            ),
          ),
        ],
      ),
    );
  }
}
