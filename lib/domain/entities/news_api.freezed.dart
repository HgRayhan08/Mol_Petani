// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsApi _$NewsApiFromJson(Map<String, dynamic> json) {
  return _NewsApi.fromJson(json);
}

/// @nodoc
mixin _$NewsApi {
  String get status => throw _privateConstructorUsedError;
  double get totalResults => throw _privateConstructorUsedError;
  List<Articles> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsApiCopyWith<NewsApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsApiCopyWith<$Res> {
  factory $NewsApiCopyWith(NewsApi value, $Res Function(NewsApi) then) =
      _$NewsApiCopyWithImpl<$Res, NewsApi>;
  @useResult
  $Res call({String status, double totalResults, List<Articles> articles});
}

/// @nodoc
class _$NewsApiCopyWithImpl<$Res, $Val extends NewsApi>
    implements $NewsApiCopyWith<$Res> {
  _$NewsApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as double,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Articles>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsApiImplCopyWith<$Res> implements $NewsApiCopyWith<$Res> {
  factory _$$NewsApiImplCopyWith(
          _$NewsApiImpl value, $Res Function(_$NewsApiImpl) then) =
      __$$NewsApiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, double totalResults, List<Articles> articles});
}

/// @nodoc
class __$$NewsApiImplCopyWithImpl<$Res>
    extends _$NewsApiCopyWithImpl<$Res, _$NewsApiImpl>
    implements _$$NewsApiImplCopyWith<$Res> {
  __$$NewsApiImplCopyWithImpl(
      _$NewsApiImpl _value, $Res Function(_$NewsApiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_$NewsApiImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as double,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Articles>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsApiImpl implements _NewsApi {
  _$NewsApiImpl(
      {required this.status,
      required this.totalResults,
      required final List<Articles> articles})
      : _articles = articles;

  factory _$NewsApiImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsApiImplFromJson(json);

  @override
  final String status;
  @override
  final double totalResults;
  final List<Articles> _articles;
  @override
  List<Articles> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'NewsApi(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsApiImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsApiImplCopyWith<_$NewsApiImpl> get copyWith =>
      __$$NewsApiImplCopyWithImpl<_$NewsApiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsApiImplToJson(
      this,
    );
  }
}

abstract class _NewsApi implements NewsApi {
  factory _NewsApi(
      {required final String status,
      required final double totalResults,
      required final List<Articles> articles}) = _$NewsApiImpl;

  factory _NewsApi.fromJson(Map<String, dynamic> json) = _$NewsApiImpl.fromJson;

  @override
  String get status;
  @override
  double get totalResults;
  @override
  List<Articles> get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsApiImplCopyWith<_$NewsApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
