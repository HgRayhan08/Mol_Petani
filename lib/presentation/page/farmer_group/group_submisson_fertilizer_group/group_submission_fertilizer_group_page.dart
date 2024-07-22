import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/mobile/mobile_submission_fertilizer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/website/website_submission_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupSubmissionFertilizerGroup extends ConsumerStatefulWidget {
  const GroupSubmissionFertilizerGroup({super.key});

  @override
  ConsumerState<GroupSubmissionFertilizerGroup> createState() =>
      _GroupSubmissionFertilizerGroupState();
}

class _GroupSubmissionFertilizerGroupState
    extends ConsumerState<GroupSubmissionFertilizerGroup> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Pupuk",
          style: largeReguler.copyWith(),
        ),
      ),
      body: MobileSubmissionFertilizer(ref: ref),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          color: blueLight,
          borderRadius: BorderRadius.all(
            Radius.circular(
              100,
            ),
          ),
        ),
        child: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("create-submission-grup");
            setState(() {});
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Pengajuan Pupuk",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Pengajuan Pupuk",
              style: largeReguler,
            ),
            trailing: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("create-submission-grup");
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
          ),
          child: SafeArea(
            child: MobileSubmissionFertilizer(ref: ref),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebsiteSubmissionFertilizer(
        ref: ref,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
