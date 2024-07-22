import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/news/news_api_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/card_article_widget.dart';

class NewsWidget extends ConsumerWidget {
  final int amounnt;
  final String routes;
  const NewsWidget({super.key, required this.amounnt, required this.routes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Berita",
              style: regulerReguler.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                ref.read(routerProvider).goNamed("news", extra: routes);
              },
              child: Text(
                "View All",
                style: regulerReguler,
              ),
            ),
          ],
        ),
        FutureBuilder(
            future: ref.watch(newsApiProviderProvider.notifier).getarticle(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!.articles;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemCount: amounnt,
                    itemBuilder: (context, index) {
                      // return Text(data[index].title!);
                      return CardArticleWidget(data[index]);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
