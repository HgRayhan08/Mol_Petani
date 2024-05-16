import 'package:dio/dio.dart';
import 'package:mol_petani/data/repository/news_api_repository.dart';
import 'package:mol_petani/domain/entities/news_api.dart';
import 'package:mol_petani/domain/entities/result.dart';

class ArticleNewsApi implements NewsApiRepository {
  final key = "5e8123b8a6434a238c8f0ef63bf85155";
  final country = "id";

  @override
  Future<Result<NewsApi>> getArticle() async {
    final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$key");
    if (response.data != null) {
      return Result.success(NewsApi.fromJson(response.data));
    } else {
      return const Result.failed("message");
    }
  }
}
