import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/group_detail_data_farmer/method/information_farmer.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class GroupDetailDataFarmerPage extends ConsumerWidget {
  const GroupDetailDataFarmerPage(this.user, {super.key});
  final UserFarmer user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          width,
          height * 0.3 -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
        ),
        child: AppbarCustomWidget(
          height: height,
          width: width,
          title: "Detail Petani",
          content: user.name,
          subContext: Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                user.noHp,
                style: regulerReguler.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              "Data Diri",
              style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          informationFarmer(user, width, height),
          SizedBox(height: height * 0.02),
          Text("Lokasi Lahan", style: regulerReguler),
          MapsWidget(idUserFarmer: user.idUserFarmer),
          SizedBox(height: height * 0.03),
          user.idGrupFarmer == ""
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
      ),
    );
  }
}
