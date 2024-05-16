import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/articles.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class CardArticleWidget extends ConsumerWidget {
  final Articles news;
  const CardArticleWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue.shade200),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // leading: Hero(
            //   tag: news.urlToImage!,
            //   child: Image.network(
            //     news.urlToImage!,
            //     width: 100,
            //   ),
            // ),
            title: Text(
              news.title!,
            ),
            subtitle: Text(news.author!),
            onTap: () {
              ref.read(routerProvider).pushNamed("news-web", extra: news.url);
            }),
      ),
    );
  }
}
