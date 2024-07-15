import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_distributor.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_distributor/mobile/mobile_detail_distributor.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_distributor/website/web_detail_distributor.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailDistributorPage extends ConsumerWidget {
  final UserDistrubutor user;
  const PplDetailDistributorPage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Distributor",
          style: largeReguler,
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("data-distributor");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: MobileDetailDistributor(user: user),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Distributor",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Detail Distributor",
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
                      .deleteDistributor(idDocument: user.uid);
                  ref.read(routerProvider).goNamed("data-distributor");
                },
                judul: "Konfirmasi Tambae Member",
                keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
              );
            },
          ),
        ),
        child: SafeArea(
          child: MobileDetailDistributor(user: user),
        ),
      ),
    );
  }

  Widget buildAWeb(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        body: WebDetailDistributor(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildAWeb);
  }
}
