// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ppl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPpl _$UserPplFromJson(Map<String, dynamic> json) {
  return _UserPpl.fromJson(json);
}

/// @nodoc
mixin _$UserPpl {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get fotoUrl => throw _privateConstructorUsedError;
  String get information => throw _privateConstructorUsedError;
  String? get nik => throw _privateConstructorUsedError;
  String? get subdistrict => throw _privateConstructorUsedError;
  List<String>? get scope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPplCopyWith<UserPpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPplCopyWith<$Res> {
  factory $UserPplCopyWith(UserPpl value, $Res Function(UserPpl) then) =
      _$UserPplCopyWithImpl<$Res, UserPpl>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String? fotoUrl,
      String information,
      String? nik,
      String? subdistrict,
      List<String>? scope});
}

/// @nodoc
class _$UserPplCopyWithImpl<$Res, $Val extends UserPpl>
    implements $UserPplCopyWith<$Res> {
  _$UserPplCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? fotoUrl = freezed,
    Object? information = null,
    Object? nik = freezed,
    Object? subdistrict = freezed,
    Object? scope = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fotoUrl: freezed == fotoUrl
          ? _value.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      nik: freezed == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      subdistrict: freezed == subdistrict
          ? _value.subdistrict
          : subdistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPplImplCopyWith<$Res> implements $UserPplCopyWith<$Res> {
  factory _$$UserPplImplCopyWith(
          _$UserPplImpl value, $Res Function(_$UserPplImpl) then) =
      __$$UserPplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String? fotoUrl,
      String information,
      String? nik,
      String? subdistrict,
      List<String>? scope});
}

/// @nodoc
class __$$UserPplImplCopyWithImpl<$Res>
    extends _$UserPplCopyWithImpl<$Res, _$UserPplImpl>
    implements _$$UserPplImplCopyWith<$Res> {
  __$$UserPplImplCopyWithImpl(
      _$UserPplImpl _value, $Res Function(_$UserPplImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? fotoUrl = freezed,
    Object? information = null,
    Object? nik = freezed,
    Object? subdistrict = freezed,
    Object? scope = freezed,
  }) {
    return _then(_$UserPplImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fotoUrl: freezed == fotoUrl
          ? _value.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      nik: freezed == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      subdistrict: freezed == subdistrict
          ? _value.subdistrict
          : subdistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value._scope
          : scope // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPplImpl implements _UserPpl {
  _$UserPplImpl(
      {required this.uid,
      required this.name,
      required this.email,
      this.fotoUrl,
      required this.information,
      this.nik,
      this.subdistrict,
      final List<String>? scope = const []})
      : _scope = scope;

  factory _$UserPplImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPplImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? fotoUrl;
  @override
  final String information;
  @override
  final String? nik;
  @override
  final String? subdistrict;
  final List<String>? _scope;
  @override
  @JsonKey()
  List<String>? get scope {
    final value = _scope;
    if (value == null) return null;
    if (_scope is EqualUnmodifiableListView) return _scope;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserPpl(uid: $uid, name: $name, email: $email, fotoUrl: $fotoUrl, information: $information, nik: $nik, subdistrict: $subdistrict, scope: $scope)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPplImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            (identical(other.information, information) ||
                other.information == information) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.subdistrict, subdistrict) ||
                other.subdistrict == subdistrict) &&
            const DeepCollectionEquality().equals(other._scope, _scope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      email,
      fotoUrl,
      information,
      nik,
      subdistrict,
      const DeepCollectionEquality().hash(_scope));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPplImplCopyWith<_$UserPplImpl> get copyWith =>
      __$$UserPplImplCopyWithImpl<_$UserPplImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPplImplToJson(
      this,
    );
  }
}

abstract class _UserPpl implements UserPpl {
  factory _UserPpl(
      {required final String uid,
      required final String name,
      required final String email,
      final String? fotoUrl,
      required final String information,
      final String? nik,
      final String? subdistrict,
      final List<String>? scope}) = _$UserPplImpl;

  factory _UserPpl.fromJson(Map<String, dynamic> json) = _$UserPplImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get fotoUrl;
  @override
  String get information;
  @override
  String? get nik;
  @override
  String? get subdistrict;
  @override
  List<String>? get scope;
  @override
  @JsonKey(ignore: true)
  _$$UserPplImplCopyWith<_$UserPplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
