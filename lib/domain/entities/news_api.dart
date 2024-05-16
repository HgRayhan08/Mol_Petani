import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mol_petani/domain/entities/articles.dart';

part 'news_api.freezed.dart';
part 'news_api.g.dart';

@freezed
class NewsApi with _$NewsApi {
  factory NewsApi({
    required String status,
    required double totalResults,
    required List<Articles> articles,
  }) = _NewsApi;

  factory NewsApi.fromJson(Map<String, dynamic> json) =>
      _$NewsApiFromJson(json);
}
