import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/news/news_api_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/card_article_widget.dart';

class Newspage extends ConsumerWidget {
  const Newspage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(routerProvider).goNamed("main-dist");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("Berita", style: largeReguler),
      ),
      body: FutureBuilder(
        future: ref.watch(newsApiProviderProvider.notifier).getarticle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.articles;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CardArticleWidget(data[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
