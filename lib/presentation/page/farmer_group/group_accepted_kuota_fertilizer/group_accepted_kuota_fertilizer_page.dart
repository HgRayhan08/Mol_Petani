import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_accepted_kuota_fertilizer/mobile/mobile_accepted_kuota.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_accepted_kuota_fertilizer/website/web_accpted_kuota.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupAcceptedKuotaFertilizerPage extends ConsumerWidget {
  const GroupAcceptedKuotaFertilizerPage({super.key});

  Widget buildAdnroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penerimaan Kelompok tani",
          style: regulerReguler,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("history-accepted-grup");
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: MobileAccptedKuota(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Penerimaan Kelompok tani",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Perimaan Kelompok tani",
              style: largeReguler,
            ),
            trailing: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("history-accepted-grup");
              },
              icon: const Icon(Icons.history),
            ),
          ),
          child: SafeArea(
            child: MobileAccptedKuota(ref: ref),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebAcceptedKuota(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAdnroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
