import 'package:mol_petani/data/artticle/article_news_api.dart';
import 'package:mol_petani/data/repository/news_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "news_repository.g.dart";

@riverpod
NewsApiRepository newsApiRepository(NewsApiRepositoryRef ref) =>
    ArticleNewsApi();
