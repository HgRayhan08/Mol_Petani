import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_data_farmer/method/information_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/maps_widget.dart';

class MobileDetailDataFarmer extends StatefulWidget {
  final UserFarmer user;
  final WidgetRef ref;
  const MobileDetailDataFarmer(
      {super.key, required this.user, required this.ref});

  @override
  State<MobileDetailDataFarmer> createState() => _MobileDetailDataFarmerState();
}

class _MobileDetailDataFarmerState extends State<MobileDetailDataFarmer> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      children: [
        SizedBox(height: height * 0.01),
        defaultTargetPlatform == TargetPlatform.iOS
            ? Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                decoration: const BoxDecoration(
                    color: blueLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name,
                      style: largeReguler.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          widget.user.noHp,
                          style: regulerReguler.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(height: height * 0.02),
        Text(
          "Data Diri",
          style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        informationDetailFarmer(widget.ref, widget.user, width, height),
        Text("Lokasi Lahan", style: regulerReguler),
        MapsWidget(
          idUserFarmer: widget.user.idUserFarmer,
          isDelete: true,
          width: width * 0.75,
        ),
        SizedBox(height: height * 0.02),
        widget.user.idFarmerGroup == ""
            ? ButtonSubmissionWidget(
                title: "Tambahkan",
                onTap: () {
                  context.buildShowDialog(
                    berhasil: "tambah",
                    judul: "Information",
                    keterangan: "Apakah Anda yakin Ingin Menambahkan",
                    onTapSucces: () {
                      widget.ref
                          .read(dataUserProvider.notifier)
                          .createMemberFarmerGroup(
                              idDocument: widget.user.idDocument!);
                      widget.ref.read(routerProvider).goNamed("data-farmer");
                    },
                  );
                  setState(() {});
                },
              )
            : Container(),
        SizedBox(height: height * 0.05)
      ],
    );
  }
}
