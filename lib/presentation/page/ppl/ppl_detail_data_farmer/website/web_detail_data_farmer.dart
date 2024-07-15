import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_data_farmer/method/web_information_farmer.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class WebDetailDataFarmer extends StatelessWidget {
  final WidgetRef ref;
  final UserFarmer user;
  const WebDetailDataFarmer({super.key, required this.ref, required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Data Petani",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            webInformationFarmer(user, width, height),
            MapsWidget(
              idUserFarmer: user.idUserFarmer,
              width: width * 0.3,
            ),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
        // Row(
        //   children: [
        //     ButtonSubmissionWidget(
        //       title: "Tambah Lokasi Sawah",
        //       onTap: () {
        //         ref
        //             .read(routerProvider)
        //             .pushNamed("ppl-form-maps", extra: user);
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
