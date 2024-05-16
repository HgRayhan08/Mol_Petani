import 'package:mol_petani/domain/usecase/get_news.dart/get_news.dart';
import 'package:mol_petani/presentation/provider/repository/news_repository/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_news_provider.g.dart";

@riverpod
GetNews getNews(GetNewsRef ref) =>
    GetNews(news: ref.read(newsApiRepositoryProvider));
