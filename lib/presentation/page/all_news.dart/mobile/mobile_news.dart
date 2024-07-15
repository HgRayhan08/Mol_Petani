import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/provider/news/news_api_provider.dart';
import 'package:mol_petani/presentation/widgets/card_article_widget.dart';

class MobileNewss extends StatelessWidget {
  final WidgetRef ref;
  const MobileNewss({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ref.watch(newsApiProviderProvider.notifier).getarticle(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!.articles;
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.01,
            ),
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
    );
  }
}
