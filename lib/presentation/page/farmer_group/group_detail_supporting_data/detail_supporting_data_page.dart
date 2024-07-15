import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/supporting_data_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_supporting_data/mobile/mobile_supporting.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_supporting_data/website/web_supporting_data.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';
import 'package:mol_petani/presentation/widgets/title_widget.dart';

class GroupDetailSupportingDataPage extends ConsumerWidget {
  final SupportingDataFertilizer data;
  const GroupDetailSupportingDataPage(this.data, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Pengajuan Petani",
            style: regulerReguler,
          ),
        ),
        body: MobileSupporting(ref: ref, data: data));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Pengajuan Petani",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Detail Pengajuan Petani",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileSupporting(ref: ref, data: data),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      // width: width * 0.9,
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
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebSupportingData(ref: ref, data: data),
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
