import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/method/submission_innformation.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/mobile/mobile_detail_acception.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_acception_kuota/website/web_detail_acception.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDetailAcceptedKuotaPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const GroupDetailAcceptedKuotaPage(this.data, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pengiriman Pupuk",
          style: regulerReguler,
        ),
      ),
      body: MobileDetailAcception(data: data, ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Pengiriman Pupuk",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("accepted-fertilizer-grup");
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Perimaan Kelompok tani",
              style: largeReguler,
            ),
            trailing: data.information != "Selesai"
                ? IconButton(
                    onPressed: () {
                      ref
                          .read(routerProvider)
                          .pushNamed("forms-acception-group", extra: data);
                    },
                    icon: Icon(Icons.check),
                  )
                : Container(width: 1),
          ),
          child: SafeArea(
            child: MobileDetailAcception(data: data, ref: ref),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      height: height * 0.6,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: Icon(Icons.close)),
        ),
        body: WebDetailAcception(data: data, ref: ref),
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
