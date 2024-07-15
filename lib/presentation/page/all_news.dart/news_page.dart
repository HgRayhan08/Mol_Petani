import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/all_news.dart/mobile/mobile_news.dart';
import 'package:mol_petani/presentation/provider/news/news_api_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/card_article_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class Newspage extends ConsumerWidget {
  const Newspage({super.key});

  Widget builAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("main-dist");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Berita",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      body: MobileNewss(ref: ref),
    );
  }

  Widget builIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "News",
      home: CupertinoPageScaffold(
          backgroundColor: background,
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
                onPressed: () {
                  ref.read(routerProvider).goNamed("main-ppl");
                },
                icon: const Icon(Icons.arrow_back_ios)),
            middle: Text(
              "Kelompok Tani",
              style: largeReguler,
            ),
          ),
          child: SafeArea(
            child: MobileNewss(ref: ref),
          )),
    );
  }

  Widget builWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return PlatformWidget(
      androidBuilder: builAndroid,
      iosBuilder: builIos,
      webBuilder: builWeb,
    );
  }
}
