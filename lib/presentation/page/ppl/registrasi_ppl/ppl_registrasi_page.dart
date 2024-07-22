import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/registrasi_ppl/mobile/mobile_registrasi_ppl.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class PplRegistrasiPage extends ConsumerStatefulWidget {
  const PplRegistrasiPage({super.key});

  @override
  ConsumerState<PplRegistrasiPage> createState() => _PplRegistrasiPageState();
}

class _PplRegistrasiPageState extends ConsumerState<PplRegistrasiPage> {
  Widget buildAdnroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("user-login");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Registrasi",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: MobileRegistrasiPpl(ref: ref),
    );
  }

  Widget buildios(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: "Registrasi Ppl",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("user-login");
              },
              icon: const Icon(Icons.arrow_back_ios)),
          middle: Text(
            "Registrasi",
            style: largeReguler.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: SafeArea(
          child: MobileRegistrasiPpl(ref: ref),
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
        androidBuilder: buildAdnroid,
        iosBuilder: buildios,
        webBuilder: buildWeb);
  }
}
