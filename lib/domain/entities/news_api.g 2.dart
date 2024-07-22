// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsApiImpl _$$NewsApiImplFromJson(Map<String, dynamic> json) =>
    _$NewsApiImpl(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toDouble(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Articles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsApiImplToJson(_$NewsApiImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
