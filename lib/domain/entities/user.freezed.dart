// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  String? get fotoUrl => throw _privateConstructorUsedError;
  List<String>? get cangkupan => throw _privateConstructorUsedError;
  String? get kelompok => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String nama,
      String email,
      String keterangan,
      String? fotoUrl,
      List<String>? cangkupan,
      String? kelompok});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nama = null,
    Object? email = null,
    Object? keterangan = null,
    Object? fotoUrl = freezed,
    Object? cangkupan = freezed,
    Object? kelompok = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      fotoUrl: freezed == fotoUrl
          ? _value.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cangkupan: freezed == cangkupan
          ? _value.cangkupan
          : cangkupan // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      kelompok: freezed == kelompok
          ? _value.kelompok
          : kelompok // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String nama,
      String email,
      String keterangan,
      String? fotoUrl,
      List<String>? cangkupan,
      String? kelompok});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nama = null,
    Object? email = null,
    Object? keterangan = null,
    Object? fotoUrl = freezed,
    Object? cangkupan = freezed,
    Object? kelompok = freezed,
  }) {
    return _then(_$UserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      fotoUrl: freezed == fotoUrl
          ? _value.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      cangkupan: freezed == cangkupan
          ? _value._cangkupan
          : cangkupan // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      kelompok: freezed == kelompok
          ? _value.kelompok
          : kelompok // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {required this.uid,
      required this.nama,
      required this.email,
      required this.keterangan,
      this.fotoUrl,
      final List<String>? cangkupan = const [],
      this.kelompok})
      : _cangkupan = cangkupan;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
  @override
  final String nama;
  @override
  final String email;
  @override
  final String keterangan;
  @override
  final String? fotoUrl;
  final List<String>? _cangkupan;
  @override
  @JsonKey()
  List<String>? get cangkupan {
    final value = _cangkupan;
    if (value == null) return null;
    if (_cangkupan is EqualUnmodifiableListView) return _cangkupan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? kelompok;

  @override
  String toString() {
    return 'User(uid: $uid, nama: $nama, email: $email, keterangan: $keterangan, fotoUrl: $fotoUrl, cangkupan: $cangkupan, kelompok: $kelompok)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            const DeepCollectionEquality()
                .equals(other._cangkupan, _cangkupan) &&
            (identical(other.kelompok, kelompok) ||
                other.kelompok == kelompok));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nama, email, keterangan,
      fotoUrl, const DeepCollectionEquality().hash(_cangkupan), kelompok);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String uid,
      required final String nama,
      required final String email,
      required final String keterangan,
      final String? fotoUrl,
      final List<String>? cangkupan,
      final String? kelompok}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid;
  @override
  String get nama;
  @override
  String get email;
  @override
  String get keterangan;
  @override
  String? get fotoUrl;
  @override
  List<String>? get cangkupan;
  @override
  String? get kelompok;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
