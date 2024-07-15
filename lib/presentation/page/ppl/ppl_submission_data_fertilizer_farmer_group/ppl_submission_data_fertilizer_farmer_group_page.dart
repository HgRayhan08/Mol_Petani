import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/mobile/mobile_data_submission_fertilizer.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/website/website_data_submission_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplSubmissionDataFertilizerFarmerGroupPage extends ConsumerWidget {
  const PplSubmissionDataFertilizerFarmerGroupPage({super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Pupuk",
          style: largeReguler,
        ),
      ),
      body: MobileDataSubmissionFertilizer(ref: ref),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Pengajuan Pupuk",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Pengajuan Pupuk",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileDataSubmissionFertilizer(ref: ref),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WebsiteDataSubmissionFertilizer(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWebsite);
  }
}