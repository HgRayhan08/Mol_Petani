import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_acception_fertilizer_received/mobile/mobile_form_accepted.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_form_acception_fertilizer_received/website/web_form_accepted.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class GroupFormsAcceptionFertilizerPage extends ConsumerWidget {
  final SubmissionKuotaFertilizer data;
  GroupFormsAcceptionFertilizerPage(this.data, {super.key});

  final TextEditingController ureaControler = TextEditingController();
  final TextEditingController poskaControler = TextEditingController();
  final TextEditingController namaControler = TextEditingController();
  final TextEditingController senderName = TextEditingController();

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Penerimaan Pupuk",
            style: regulerReguler,
          ),
        ),
        body: MobileFormAccepted(
          ref: ref,
          data: data,
          namaControler: namaControler,
          poskaControler: poskaControler,
          senderName: senderName,
          ureaControler: ureaControler,
        ));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Penerimaan Pupuk",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref
                  .read(routerProvider)
                  .goNamed("detail-accepted-grup", extra: data);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Perimaan Kelompok tani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              if (poskaControler.text == "" ||
                  ureaControler.text == "" ||
                  senderName.text == "" ||
                  namaControler.text == "") {
                context.buildAlertInformation(
                    title: "Pesan",
                    subTitle: "Please enter the data completely");
              } else {
                context.buildAlertInformation(
                    title: "Pesan", subTitle: "Berhasil Menambahkan Data");
                ref
                    .read(fertilizerSubmissionProvider.notifier)
                    .updateAcceptionFertilizerGroup(
                      idDocument: data.idDocument.toString(),
                      acceptPoska: int.parse(poskaControler.text),
                      acceptUrea: int.parse(ureaControler.text),
                      nameSendDistributor: senderName.text,
                      nameAcceptGroupFarmer: namaControler.text,
                    );
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    ref
                        .read(routerProvider)
                        .goNamed("accepted-fertilizer-grup");
                  },
                );
              }
            },
            icon: const Icon(Icons.check),
          ),
        ),
        child: SafeArea(
          child: MobileFormAccepted(
            ref: ref,
            data: data,
            namaControler: namaControler,
            poskaControler: poskaControler,
            senderName: senderName,
            ureaControler: ureaControler,
          ),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      child: Scaffold(
        body: WebFormAccepted(
          ref: ref,
          data: data,
          namaControler: namaControler,
          poskaControler: poskaControler,
          senderName: senderName,
          ureaControler: ureaControler,
        ),
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
