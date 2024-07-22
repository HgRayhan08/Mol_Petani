// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AreaLocation _$AreaLocationFromJson(Map<String, dynamic> json) {
  return _AreaLocation.fromJson(json);
}

/// @nodoc
mixin _$AreaLocation {
  String get farmerName => throw _privateConstructorUsedError;
  String get idUserFarmer => throw _privateConstructorUsedError;
  String get idPPL => throw _privateConstructorUsedError;
  String? get idDocument => throw _privateConstructorUsedError;
  @LatLngConverter()
  List<LatLng> get cordinatPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AreaLocationCopyWith<AreaLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaLocationCopyWith<$Res> {
  factory $AreaLocationCopyWith(
          AreaLocation value, $Res Function(AreaLocation) then) =
      _$AreaLocationCopyWithImpl<$Res, AreaLocation>;
  @useResult
  $Res call(
      {String farmerName,
      String idUserFarmer,
      String idPPL,
      String? idDocument,
      @LatLngConverter() List<LatLng> cordinatPoint});
}

/// @nodoc
class _$AreaLocationCopyWithImpl<$Res, $Val extends AreaLocation>
    implements $AreaLocationCopyWith<$Res> {
  _$AreaLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmerName = null,
    Object? idUserFarmer = null,
    Object? idPPL = null,
    Object? idDocument = freezed,
    Object? cordinatPoint = null,
  }) {
    return _then(_value.copyWith(
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      idUserFarmer: null == idUserFarmer
          ? _value.idUserFarmer
          : idUserFarmer // ignore: cast_nullable_to_non_nullable
              as String,
      idPPL: null == idPPL
          ? _value.idPPL
          : idPPL // ignore: cast_nullable_to_non_nullable
              as String,
      idDocument: freezed == idDocument
          ? _value.idDocument
          : idDocument // ignore: cast_nullable_to_non_nullable
              as String?,
      cordinatPoint: null == cordinatPoint
          ? _value.cordinatPoint
          : cordinatPoint // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AreaLocationImplCopyWith<$Res>
    implements $AreaLocationCopyWith<$Res> {
  factory _$$AreaLocationImplCopyWith(
          _$AreaLocationImpl value, $Res Function(_$AreaLocationImpl) then) =
      __$$AreaLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmerName,
      String idUserFarmer,
      String idPPL,
      String? idDocument,
      @LatLngConverter() List<LatLng> cordinatPoint});
}

/// @nodoc
class __$$AreaLocationImplCopyWithImpl<$Res>
    extends _$AreaLocationCopyWithImpl<$Res, _$AreaLocationImpl>
    implements _$$AreaLocationImplCopyWith<$Res> {
  __$$AreaLocationImplCopyWithImpl(
      _$AreaLocationImpl _value, $Res Function(_$AreaLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmerName = null,
    Object? idUserFarmer = null,
    Object? idPPL = null,
    Object? idDocument = freezed,
    Object? cordinatPoint = null,
  }) {
    return _then(_$AreaLocationImpl(
      farmerName: null == farmerName
          ? _value.farmerName
          : farmerName // ignore: cast_nullable_to_non_nullable
              as String,
      idUserFarmer: null == idUserFarmer
          ? _value.idUserFarmer
          : idUserFarmer // ignore: cast_nullable_to_non_nullable
              as String,
      idPPL: null == idPPL
          ? _value.idPPL
          : idPPL // ignore: cast_nullable_to_non_nullable
              as String,
      idDocument: freezed == idDocument
          ? _value.idDocument
          : idDocument // ignore: cast_nullable_to_non_nullable
              as String?,
      cordinatPoint: null == cordinatPoint
          ? _value._cordinatPoint
          : cordinatPoint // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaLocationImpl implements _AreaLocation {
  _$AreaLocationImpl(
      {required this.farmerName,
      required this.idUserFarmer,
      required this.idPPL,
      this.idDocument,
      @LatLngConverter() required final List<LatLng> cordinatPoint})
      : _cordinatPoint = cordinatPoint;

  factory _$AreaLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaLocationImplFromJson(json);

  @override
  final String farmerName;
  @override
  final String idUserFarmer;
  @override
  final String idPPL;
  @override
  final String? idDocument;
  final List<LatLng> _cordinatPoint;
  @override
  @LatLngConverter()
  List<LatLng> get cordinatPoint {
    if (_cordinatPoint is EqualUnmodifiableListView) return _cordinatPoint;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cordinatPoint);
  }

  @override
  String toString() {
    return 'AreaLocation(farmerName: $farmerName, idUserFarmer: $idUserFarmer, idPPL: $idPPL, idDocument: $idDocument, cordinatPoint: $cordinatPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaLocationImpl &&
            (identical(other.farmerName, farmerName) ||
                other.farmerName == farmerName) &&
            (identical(other.idUserFarmer, idUserFarmer) ||
                other.idUserFarmer == idUserFarmer) &&
            (identical(other.idPPL, idPPL) || other.idPPL == idPPL) &&
            (identical(other.idDocument, idDocument) ||
                other.idDocument == idDocument) &&
            const DeepCollectionEquality()
                .equals(other._cordinatPoint, _cordinatPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, farmerName, idUserFarmer, idPPL,
      idDocument, const DeepCollectionEquality().hash(_cordinatPoint));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaLocationImplCopyWith<_$AreaLocationImpl> get copyWith =>
      __$$AreaLocationImplCopyWithImpl<_$AreaLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaLocationImplToJson(
      this,
    );
  }
}

abstract class _AreaLocation implements AreaLocation {
  factory _AreaLocation(
          {required final String farmerName,
          required final String idUserFarmer,
          required final String idPPL,
          final String? idDocument,
          @LatLngConverter() required final List<LatLng> cordinatPoint}) =
      _$AreaLocationImpl;

  factory _AreaLocation.fromJson(Map<String, dynamic> json) =
      _$AreaLocationImpl.fromJson;

  @override
  String get farmerName;
  @override
  String get idUserFarmer;
  @override
  String get idPPL;
  @override
  String? get idDocument;
  @override
  @LatLngConverter()
  List<LatLng> get cordinatPoint;
  @override
  @JsonKey(ignore: true)
  _$$AreaLocationImplCopyWith<_$AreaLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
