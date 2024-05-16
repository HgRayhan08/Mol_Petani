import 'package:mol_petani/domain/entities/news_api.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class NewsApiRepository {
  Future<Result<NewsApi>> getArticle();
}
