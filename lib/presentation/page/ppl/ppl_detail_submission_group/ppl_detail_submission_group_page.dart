import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_submission_group/mobile/mobile_detail_submission_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_detail_submission_group/website/web_detail_submission_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplDetailSubmissionGroup extends ConsumerWidget {
  final DataSubmissionGroup data;
  final UserFarmerGroup user;
  const PplDetailSubmissionGroup(this.data, this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("submission-group", extra: user);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Data Pengajuan"),
      ),
      body: MobileDetailSubmissionGroup(ref: ref, data: data),
      floatingActionButton: IconButton(
        onPressed: () {
          ref
              .read(routerProvider)
              .goNamed("create-submission-farmer", extra: data);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Data Pengajuan",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref
                    .read(routerProvider)
                    .goNamed("submission-group", extra: user);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Pengajuan Pupuk",
            style: largeReguler,
          ),
          // trailing: IconButton(
          //   onPressed: () {
          //     ref
          //         .read(routerProvider)
          //         .goNamed("create-submission-farmer", extra: data);
          //   },
          //   icon: const Icon(Icons.add),
          // ),
        ),
        child: SafeArea(
          child: MobileDetailSubmissionGroup(ref: ref, data: data),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leadingWidth: width * 0.06,
          leading: TextButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                context.pop();
              },
              child: Text("Back", style: regulerReguler)),
        ),
        body: WebDetailSubmissionGroup(data: data, ref: ref));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWebsite);
  }
}
