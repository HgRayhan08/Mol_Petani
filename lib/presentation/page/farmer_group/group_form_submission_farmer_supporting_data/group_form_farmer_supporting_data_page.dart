import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mol_petani/domain/entities/submission_fertilizer_group.dart';
import 'package:mol_petani/domain/entities/user_farmer_grup.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_submission_farmer_supporting_data/mobile/mobile_form_submission_supporting.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupFormSubmissionFarmerSupportingDataPage
    extends ConsumerStatefulWidget {
  final DataSubmissionGroup data;

  const GroupFormSubmissionFarmerSupportingDataPage(this.data, {super.key});
  @override
  ConsumerState<GroupFormSubmissionFarmerSupportingDataPage> createState() =>
      _GroupFormSubmissionFarmerSupportingDataPageState();
}

class _GroupFormSubmissionFarmerSupportingDataPageState
    extends ConsumerState<GroupFormSubmissionFarmerSupportingDataPage> {
  final TextEditingController namaPetaniControler = TextEditingController();
  final TextEditingController nikControler = TextEditingController();
  final TextEditingController luasLahanControler = TextEditingController();
  XFile? fotoKtp;
  XFile? fotoKk;
  XFile? fotoPajak;

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Submission Fertilizer",
          style: regulerReguler.copyWith(fontSize: 18),
        ),
      ),
      body: MobileFormSubmissionSupporting(
          ref: ref,
          data: widget.data,
          namaPetaniControler: namaPetaniControler,
          nikControler: nikControler,
          luasLahanControler: luasLahanControler),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Create Submission Fertilizer",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref
                  .read(routerProvider)
                  .goNamed("detail-submission-grup", extra: widget.data);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Perimaan Kelompok tani",
            style: largeReguler,
          ),
        ),
        child: SafeArea(
          child: MobileFormSubmissionSupporting(
              ref: ref,
              data: widget.data,
              namaPetaniControler: namaPetaniControler,
              nikControler: nikControler,
              luasLahanControler: luasLahanControler),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
