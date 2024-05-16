import 'package:mol_petani/domain/entities/news_api.dart';
import 'package:mol_petani/domain/usecase/get_news.dart/get_news.dart';
import 'package:mol_petani/presentation/provider/usecases/get_news_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "news_api_provider.g.dart";

@Riverpod(keepAlive: true)
class NewsApiProvider extends _$NewsApiProvider {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<NewsApi> getarticle() async {
    GetNews news = ref.read(getNewsProvider);

    var result = await news(0);
    return result.resultValue!;
  }
}
