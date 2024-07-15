import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_additional_data_fertilizer_page/mobile/mobile_additional_data.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_additional_data_fertilizer_page/website/web_additional_data.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/listTile_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupAdditionalFertilizerPage extends ConsumerStatefulWidget {
  final DataSubmissionGroup data;
  const GroupAdditionalFertilizerPage(this.data, {super.key});

  @override
  ConsumerState<GroupAdditionalFertilizerPage> createState() =>
      _GroupAdditionalFertilizerPageState();
}

class _GroupAdditionalFertilizerPageState
    extends ConsumerState<GroupAdditionalFertilizerPage> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pengajuan"),
      ),
      body: MobileAdditionalFertilizer(ref: ref, data: widget.data),
      floatingActionButton: IconButton(
        onPressed: () {
          ref
              .read(routerProvider)
              .goNamed("create-submission-farmer", extra: widget.data);
          setState(() {});
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
                ref
                    .read(routerProvider)
                    .goNamed("create-submission-farmer", extra: widget.data);
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
          ),
          child: SafeArea(
            child: MobileAdditionalFertilizer(ref: ref, data: widget.data),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
      body: WebAdditionalData(
        data: widget.data,
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
