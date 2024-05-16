// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
mixin _$WeatherData {
// required int queryCost,
// required double latitude,
// required double longitude,
// required String resolvedAddress,
// required String address,
// required String timezone,
// required int tzoffset,
// String? description,
// required List days,
// List<dynamic>? alerts,
// required Map stations,
// List? currentConditions,
  int get queryCost => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get resolvedAddress => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  int get tzoffset => throw _privateConstructorUsedError;
  List<dynamic> get days => throw _privateConstructorUsedError;
  Map<String, dynamic> get stations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) then) =
      _$WeatherDataCopyWithImpl<$Res, WeatherData>;
  @useResult
  $Res call(
      {int queryCost,
      double latitude,
      double longitude,
      String resolvedAddress,
      String address,
      String timezone,
      int tzoffset,
      List<dynamic> days,
      Map<String, dynamic> stations});
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryCost = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? resolvedAddress = null,
    Object? address = null,
    Object? timezone = null,
    Object? tzoffset = null,
    Object? days = null,
    Object? stations = null,
  }) {
    return _then(_value.copyWith(
      queryCost: null == queryCost
          ? _value.queryCost
          : queryCost // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      tzoffset: null == tzoffset
          ? _value.tzoffset
          : tzoffset // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      stations: null == stations
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDataImplCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$WeatherDataImplCopyWith(
          _$WeatherDataImpl value, $Res Function(_$WeatherDataImpl) then) =
      __$$WeatherDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int queryCost,
      double latitude,
      double longitude,
      String resolvedAddress,
      String address,
      String timezone,
      int tzoffset,
      List<dynamic> days,
      Map<String, dynamic> stations});
}

/// @nodoc
class __$$WeatherDataImplCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$WeatherDataImpl>
    implements _$$WeatherDataImplCopyWith<$Res> {
  __$$WeatherDataImplCopyWithImpl(
      _$WeatherDataImpl _value, $Res Function(_$WeatherDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryCost = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? resolvedAddress = null,
    Object? address = null,
    Object? timezone = null,
    Object? tzoffset = null,
    Object? days = null,
    Object? stations = null,
  }) {
    return _then(_$WeatherDataImpl(
      queryCost: null == queryCost
          ? _value.queryCost
          : queryCost // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      resolvedAddress: null == resolvedAddress
          ? _value.resolvedAddress
          : resolvedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      tzoffset: null == tzoffset
          ? _value.tzoffset
          : tzoffset // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      stations: null == stations
          ? _value._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataImpl implements _WeatherData {
  _$WeatherDataImpl(
      {required this.queryCost,
      required this.latitude,
      required this.longitude,
      required this.resolvedAddress,
      required this.address,
      required this.timezone,
      required this.tzoffset,
      required final List<dynamic> days,
      required final Map<String, dynamic> stations})
      : _days = days,
        _stations = stations;

  factory _$WeatherDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataImplFromJson(json);

// required int queryCost,
// required double latitude,
// required double longitude,
// required String resolvedAddress,
// required String address,
// required String timezone,
// required int tzoffset,
// String? description,
// required List days,
// List<dynamic>? alerts,
// required Map stations,
// List? currentConditions,
  @override
  final int queryCost;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String resolvedAddress;
  @override
  final String address;
  @override
  final String timezone;
  @override
  final int tzoffset;
  final List<dynamic> _days;
  @override
  List<dynamic> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  final Map<String, dynamic> _stations;
  @override
  Map<String, dynamic> get stations {
    if (_stations is EqualUnmodifiableMapView) return _stations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stations);
  }

  @override
  String toString() {
    return 'WeatherData(queryCost: $queryCost, latitude: $latitude, longitude: $longitude, resolvedAddress: $resolvedAddress, address: $address, timezone: $timezone, tzoffset: $tzoffset, days: $days, stations: $stations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataImpl &&
            (identical(other.queryCost, queryCost) ||
                other.queryCost == queryCost) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.resolvedAddress, resolvedAddress) ||
                other.resolvedAddress == resolvedAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.tzoffset, tzoffset) ||
                other.tzoffset == tzoffset) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality().equals(other._stations, _stations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      queryCost,
      latitude,
      longitude,
      resolvedAddress,
      address,
      timezone,
      tzoffset,
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(_stations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      __$$WeatherDataImplCopyWithImpl<_$WeatherDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataImplToJson(
      this,
    );
  }
}

abstract class _WeatherData implements WeatherData {
  factory _WeatherData(
      {required final int queryCost,
      required final double latitude,
      required final double longitude,
      required final String resolvedAddress,
      required final String address,
      required final String timezone,
      required final int tzoffset,
      required final List<dynamic> days,
      required final Map<String, dynamic> stations}) = _$WeatherDataImpl;

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$WeatherDataImpl.fromJson;

  @override // required int queryCost,
// required double latitude,
// required double longitude,
// required String resolvedAddress,
// required String address,
// required String timezone,
// required int tzoffset,
// String? description,
// required List days,
// List<dynamic>? alerts,
// required Map stations,
// List? currentConditions,
  int get queryCost;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get resolvedAddress;
  @override
  String get address;
  @override
  String get timezone;
  @override
  int get tzoffset;
  @override
  List<dynamic> get days;
  @override
  Map<String, dynamic> get stations;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
