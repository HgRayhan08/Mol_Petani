// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_petani.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPetani _$UserPetaniFromJson(Map<String, dynamic> json) {
  return _UserPetani.fromJson(json);
}

/// @nodoc
mixin _$UserPetani {
  String get nama => throw _privateConstructorUsedError;
  String get kelompokTani => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPetaniCopyWith<UserPetani> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPetaniCopyWith<$Res> {
  factory $UserPetaniCopyWith(
          UserPetani value, $Res Function(UserPetani) then) =
      _$UserPetaniCopyWithImpl<$Res, UserPetani>;
  @useResult
  $Res call({String nama, String kelompokTani});
}

/// @nodoc
class _$UserPetaniCopyWithImpl<$Res, $Val extends UserPetani>
    implements $UserPetaniCopyWith<$Res> {
  _$UserPetaniCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = null,
    Object? kelompokTani = null,
  }) {
    return _then(_value.copyWith(
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      kelompokTani: null == kelompokTani
          ? _value.kelompokTani
          : kelompokTani // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPetaniImplCopyWith<$Res>
    implements $UserPetaniCopyWith<$Res> {
  factory _$$UserPetaniImplCopyWith(
          _$UserPetaniImpl value, $Res Function(_$UserPetaniImpl) then) =
      __$$UserPetaniImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nama, String kelompokTani});
}

/// @nodoc
class __$$UserPetaniImplCopyWithImpl<$Res>
    extends _$UserPetaniCopyWithImpl<$Res, _$UserPetaniImpl>
    implements _$$UserPetaniImplCopyWith<$Res> {
  __$$UserPetaniImplCopyWithImpl(
      _$UserPetaniImpl _value, $Res Function(_$UserPetaniImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = null,
    Object? kelompokTani = null,
  }) {
    return _then(_$UserPetaniImpl(
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      kelompokTani: null == kelompokTani
          ? _value.kelompokTani
          : kelompokTani // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPetaniImpl implements _UserPetani {
  _$UserPetaniImpl({required this.nama, required this.kelompokTani});

  factory _$UserPetaniImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPetaniImplFromJson(json);

  @override
  final String nama;
  @override
  final String kelompokTani;

  @override
  String toString() {
    return 'UserPetani(nama: $nama, kelompokTani: $kelompokTani)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPetaniImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.kelompokTani, kelompokTani) ||
                other.kelompokTani == kelompokTani));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nama, kelompokTani);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPetaniImplCopyWith<_$UserPetaniImpl> get copyWith =>
      __$$UserPetaniImplCopyWithImpl<_$UserPetaniImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPetaniImplToJson(
      this,
    );
  }
}

abstract class _UserPetani implements UserPetani {
  factory _UserPetani(
      {required final String nama,
      required final String kelompokTani}) = _$UserPetaniImpl;

  factory _UserPetani.fromJson(Map<String, dynamic> json) =
      _$UserPetaniImpl.fromJson;

  @override
  String get nama;
  @override
  String get kelompokTani;
  @override
  @JsonKey(ignore: true)
  _$$UserPetaniImplCopyWith<_$UserPetaniImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
