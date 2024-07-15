import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/mobile/mobile_complaint.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_complaint_report/website/web_complaint.dart';
import 'package:mol_petani/presentation/provider/report/report_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailComplaintReportPage extends ConsumerWidget {
  final Report data;
  const PplDetailComplaintReportPage(this.data, {super.key});

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
            content: data.groupFarmer,
            subContext: Text(
              " Keterangan : ${data.information}",
              style: regulerReguler.copyWith(color: Colors.white),
            ),
          ),
        ),
        body: MobileComplaint(data: data, ref: ref));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CupertinoApp(
      title: "Detail Pelaporan",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Detail Laporan Petani",
            style: largeReguler,
          ),
          trailing: data.information == "Terima"
              ? Container(width: 1)
              : IconButton(
                  onPressed: () {
                    context.buildShowDialog(
                      judul: "Konfirmasi Terima",
                      berhasil: "Terima",
                      keterangan: "Apakah Anda Telah Menerima Laporan?",
                      onTapCancel: () {},
                      onTapSucces: () {
                        ref
                            .read(reportProviderProvider.notifier)
                            .updateStatusComplaint(
                                idDocument: data.idDocument!);
                      },
                    );
                  },
                  icon: Icon(Icons.check),
                ),
        ),
        child: SafeArea(
          child: MobileComplaint(data: data, ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.5,
      height: height * 0.6,
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
        body: WebComplaint(data: data, ref: ref),
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
