import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_farmer_grup/mobile/mobile_detail_farmer_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_farmer_grup/website/website_detail_farmer_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_detail_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailFarmerGroupPage extends ConsumerWidget {
  final UserFarmerGroup user;
  const PplDetailFarmerGroupPage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Kelompok Tani",
          style: largeReguler,
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("data-grup-farmer");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.buildShowDialog(
                berhasil: "Hapus",
                onTapCancel: () {},
                onTapSucces: () async {
                  ref
                      .read(dataUserProvider.notifier)
                      .deleteFarmerGroup(idDocument: user.uid);
                  ref.read(routerProvider).goNamed("data-grup-farmer");
                },
                judul: "Konfirmasi Tambae Member",
                keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
              );
            },
          ),
        ],
      ),
      body: MobileDetailFarmerGroup(user: user),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Kelompok Tani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("data-grup-farmer");
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Detail Kelompok Tani",
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
                      .deleteFarmerGroup(idDocument: user.uid);
                  ref.read(routerProvider).goNamed("data-grup-farmer");
                },
                judul: "Konfirmasi Tambae Member",
                keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
              );
            },
          ),
        ),
        child: SafeArea(
          child: MobileDetailFarmerGroup(user: user),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.6,
      height: height * 0.6,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(
                Icons.cancel,
              )),
        ),
        body: WebsiteDetailFarmerGroup(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
      androidBuilder: buildAndroid,
      iosBuilder: buildIos,
      webBuilder: buildWebsite,
    );
  }
}
