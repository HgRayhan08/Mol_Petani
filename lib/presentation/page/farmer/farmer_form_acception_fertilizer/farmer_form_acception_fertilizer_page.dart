import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/distribution_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_form_acception_fertilizer/mobile/mobile_form_acception.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_form_acception_fertilizer/website/web_from_acception.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class FarmerFormAcceptionFertilizerPage extends ConsumerStatefulWidget {
  final DistributionFertilizerFarmer dataFertilizer;
  const FarmerFormAcceptionFertilizerPage(this.dataFertilizer, {super.key});

  @override
  ConsumerState<FarmerFormAcceptionFertilizerPage> createState() =>
      _FarmerFormAcceptionFertilizerPageState();
}

class _FarmerFormAcceptionFertilizerPageState
    extends ConsumerState<FarmerFormAcceptionFertilizerPage> {
  TextEditingController ureaController = TextEditingController();
  TextEditingController poskaController = TextEditingController();
  TextEditingController plantController = TextEditingController();
  @override
  void dispose() {
    ureaController.dispose();
    poskaController.dispose();
    plantController.dispose();
    super.dispose();
  }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("farmer-detail-accepted",
                  extra: widget.dataFertilizer);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          "Form Penerimaan",
          style: largeReguler,
        ),
      ),
      body: MobileFormAcception(
        ref: ref,
        dataFertilizer: widget.dataFertilizer,
        ureaController: ureaController,
        poskaController: poskaController,
        plantController: plantController,
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Form Penerimaan",
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("farmer-detail-accepted",
                    extra: widget.dataFertilizer);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Form Penerimaan",
              style: largeReguler,
            ),
          ),
          child: SafeArea(
            child: MobileFormAcception(
              ref: ref,
              dataFertilizer: widget.dataFertilizer,
              ureaController: ureaController,
              poskaController: poskaController,
              plantController: plantController,
            ),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              onPressed: () {
                ref.read(routerProvider).pop();
              },
              icon: const Icon(
                Icons.cancel,
              )),
        ),
        body: WebFormAcception(
          ref: ref,
          dataFertilizer: widget.dataFertilizer,
          ureaController: ureaController,
          poskaController: poskaController,
          plantController: plantController,
        ),
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
