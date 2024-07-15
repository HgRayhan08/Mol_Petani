import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_distribution_fertilizer_farmer/mobile/mobile_form_distribution.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_distribution_fertilizer_farmer/website/web_form_distribution.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupFormDistributionFertilizerFarmerPage extends ConsumerStatefulWidget {
  final UserFarmer user;
  const GroupFormDistributionFertilizerFarmerPage(this.user, {super.key});

  @override
  ConsumerState<GroupFormDistributionFertilizerFarmerPage> createState() =>
      _GroupFormDistributionFertilizerFarmerPageState();
}

class _GroupFormDistributionFertilizerFarmerPageState
    extends ConsumerState<GroupFormDistributionFertilizerFarmerPage> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController distributionController = TextEditingController();
  final TextEditingController ureaController = TextEditingController();
  final TextEditingController poskaController = TextEditingController();

  // @override
  // void dispose() {
  //   yearController.dispose();
  //   distributionController.dispose();
  //   ureaController.dispose();
  //   poskaController.dispose();
  //   super.dispose();
  // }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pembagian Pupuk", style: largeReguler),
        ),
        body: MobileFormDistribution(
            ref: ref,
            user: widget.user,
            yearController: yearController,
            distributionController: distributionController,
            ureaController: ureaController,
            poskaController: poskaController));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Pembagian Pupuk",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Distributution Pupuk",
            style: largeReguler,
          ),
          trailing: IconButton(
              onPressed: () {
                if (distributionController.text == "" ||
                    poskaController.text == "" ||
                    ureaController.text == "") {
                  context.buildAlertInformation(
                      title: "Pesan",
                      subTitle: "Please enter the data completely");
                } else {
                  context.buildAlertInformation(
                      title: "Pesan", subTitle: "Berhasil Menambahkan Data");
                  ref
                      .read(fertilizerSubmissionProvider.notifier)
                      .createSendFertilizerFarmer(
                        idGroupFarmer: widget.user.idGrupFarmer,
                        idUserFarmer: widget.user.idUserFarmer,
                        idPPL: widget.user.idPPL,
                        farmerName: widget.user.name,
                        year: yearController.text,
                        distribution: distributionController.text,
                        ureaDistribution: int.parse(ureaController.text),
                        poskaDistribution: int.parse(poskaController.text),
                      );
                  Future.delayed(const Duration(seconds: 3), () {
                    ref.read(routerProvider).pop();
                  });
                }
              },
              icon: const Icon(Icons.check)),
        ),
        child: SafeArea(
          child: MobileFormDistribution(
              ref: ref,
              user: widget.user,
              yearController: yearController,
              distributionController: distributionController,
              ureaController: ureaController,
              poskaController: poskaController),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.5,
      height: height * 0.8,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                // ref.read(routerProvider).pop();
                Navigator.of(context).pop();
                // context.pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebFormDistribution(
            ref: ref,
            user: widget.user,
            yearController: yearController,
            distributionController: distributionController,
            ureaController: ureaController,
            poskaController: poskaController),
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
