import 'package:mol_petani/data/repository/news_api_repository.dart';
import 'package:mol_petani/domain/entities/news_api.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetNews implements UseCase<Result<NewsApi>, void> {
  final NewsApiRepository news;

  GetNews({required this.news});

  @override
  Future<Result<NewsApi>> call(void _) async {
    var result = await news.getArticle();

    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message)
    };
  }
}
