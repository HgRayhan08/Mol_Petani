import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_addintial.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/method/information_purpose_group.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/mobile/mobile_detail_send_fertilizer.dart';
import 'package:mol_petani/presentation/page/distributor/distribution_detail_send_fertilizer/website/web_detail_send_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class DistributionDetailSendFertilizerPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  const DistributionDetailSendFertilizerPage(this.data, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Pengiriman",
          style: largeReguler,
        ),
        actions: [
          data.information == "Selesai"
              ? Container()
              : IconButton(
                  onPressed: () {
                    ref.read(routerProvider).goNamed(
                          "update-send-fertilizer",
                          extra: data,
                        );
                  },
                  icon: const Icon(Icons.edit),
                ),
        ],
      ),
      body: MobileDetailSendFertilizer(
        ref: ref,
        data: data,
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Pengiriman",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Detail Pengiriman",
            style: largeReguler,
          ),
          trailing: data.information == "Selesai"
              ? Container()
              : IconButton(
                  onPressed: () {
                    ref.read(routerProvider).goNamed(
                          "update-send-fertilizer",
                          extra: data,
                        );
                  },
                  icon: const Icon(Icons.edit),
                ),
        ),
        child: SafeArea(
          child: MobileDetailSendFertilizer(
            ref: ref,
            data: data,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.6,
      height: data.information == "Selesai" ? height * 0.8 : height * 0.5,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
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
        body: WebDetailSendFertilizer(
          ref: ref,
          data: data,
        ),
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
