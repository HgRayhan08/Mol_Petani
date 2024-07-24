import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_group/mobile/mobile_submission_group.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_group/website/website_submission_group.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplSubmissionGroupPage extends ConsumerWidget {
  final UserFarmerGroup userGroup;
  const PplSubmissionGroupPage(this.userGroup, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("collection-submission-group");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(userGroup.farmerGrup),
      ),
      body: MobileSubmissionGroup(ref: ref, userGroup: userGroup),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: userGroup.farmerGrup,
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("collection-submission-group");
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            userGroup.farmerGrup,
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileSubmissionGroup(ref: ref, userGroup: userGroup),
        ),
      ),
    );
  }

  Widget buildWebsite(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: width * 0.06,
        leading: TextButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              ref.read(routerProvider).goNamed("main-ppl");
            },
            child: Text("Back", style: regulerReguler)),
      ),
      body: WebsiteSubmissionGroup(ref: ref, userGroup: userGroup),
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
