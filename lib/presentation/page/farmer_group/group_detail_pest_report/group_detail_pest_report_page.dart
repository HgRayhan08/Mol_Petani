import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_pest_report/method/information_pest_report.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_pest_report/mobile/mobile_detail_pest.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDetailPestReportPage extends ConsumerWidget {
  final PestReport data;
  const GroupDetailPestReportPage(this.data, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
            title: "detail Pelaporan",
            content: data.nameFarmerGroup,
            subContext: Text(
              " Keterangan : ${data.information}",
              style: regulerReguler.copyWith(color: Colors.white),
            ),
          ),
        ),
        body: MobileDetailPest(ref: ref, data: data));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Laporan Hama",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("report-hama");
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Data Petani",
            style: largeReguler,
          ),
          trailing: data.information != "Terima"
              ? IconButton(
                  onPressed: () {
                    context.buildShowDialog(
                      berhasil: "Hapus",
                      onTapCancel: () {},
                      onTapSucces: () async {
                        ref
                            .read(reportProviderProvider.notifier)
                            .deletePest(idDocument: data.idDocument.toString());
                        ref.read(routerProvider).goNamed("report-hama");
                      },
                      judul: "Konfirmasi Tambae Member",
                      keterangan: "Apakah Anda yakin ingin Menambah Memmber?",
                    );
                  },
                  icon: Icon(Icons.delete))
              : Container(
                  width: 0.5,
                ),
        ),
        child: SafeArea(
          child: MobileDetailPest(ref: ref, data: data),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
