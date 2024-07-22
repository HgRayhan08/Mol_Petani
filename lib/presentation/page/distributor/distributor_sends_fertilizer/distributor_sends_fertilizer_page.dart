import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_sends_fertilizer/mobile/mobile_sends_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_sends_fertilizer/website/web_sends_fertilizer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class DistributorSendsFertilizerPage extends StatefulWidget {
  const DistributorSendsFertilizerPage({super.key});

  @override
  State<DistributorSendsFertilizerPage> createState() =>
      _DistributorSendsFertilizerPageState();
}

class _DistributorSendsFertilizerPageState
    extends State<DistributorSendsFertilizerPage> {
  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengiriman Pupuk Distributor",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(routerProvider).goNamed("distributor-history-sends");
              setState(() {});
            },
            icon: const Icon(Icons.history),
          )
        ],
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: MobileSendsFertilizer(ref: ref),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ref.read(routerProvider).goNamed("forms-sends-fertilizer");
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildAIos(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return CupertinoApp(
      title: "Pengiriman Pupuk Distributor",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Pengiriman Pupuk Distributor",
            style: largeReguler,
          ),
          trailing: SizedBox(
            width: width * 0.23,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ref.read(routerProvider).goNamed("forms-sends-fertilizer");
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.add,
                    size: width * 0.07,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ref
                        .read(routerProvider)
                        .goNamed("distributor-history-sends");
                  },
                  icon: Icon(
                    Icons.history,
                    size: width * 0.07,
                  ),
                )
              ],
            ),
          ),
        ),
        child: SafeArea(
          child: MobileSendsFertilizer(ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WebSendsFertilizer(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildAIos,
        webBuilder: buildWeb);
  }
}
