import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_data_farmer/mobile/mobile_detail_data_farmer.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_data_farmer/website/web_detail_data_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailDataFarmerPage extends ConsumerWidget {
  final UserFarmer user;
  const PplDetailDataFarmerPage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
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
          title: "detail Petani",
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
      body: MobileDetailDataFarmer(ref: ref, user: user),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      title: "detail Petani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "detail Petani",
            style: largeReguler,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.buildShowDialog(
                berhasil: "Hapus",
                onTapCancel: () {},
                onTapSucces: () async {
                  ref
                      .read(dataUserProvider.notifier)
                      .deleteFarmer(idDocument: user.idDocument!);
                  ref.read(routerProvider).pop();
                },
                judul: "Konfirmasi Tambae Member",
                keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
              );
            },
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.02,
              ),
              decoration: const BoxDecoration(
                color: blueLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: largeReguler.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                        user.noHp,
                        style: regulerReguler.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MobileDetailDataFarmer(ref: ref, user: user)
          ],
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      height: height * 0.5,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                // ref.read(routerProvider).pop();
                Navigator.of(context).pop();
                // context.pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebDetailDataFarmer(ref: ref, user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
