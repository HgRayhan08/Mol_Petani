// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengajuan_pupuk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PengajuanPupuk _$PengajuanPupukFromJson(Map<String, dynamic> json) {
  return _PengajuanPupuk.fromJson(json);
}

/// @nodoc
mixin _$PengajuanPupuk {
  String get idPengajuan => throw _privateConstructorUsedError;
  String get desa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PengajuanPupukCopyWith<PengajuanPupuk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PengajuanPupukCopyWith<$Res> {
  factory $PengajuanPupukCopyWith(
          PengajuanPupuk value, $Res Function(PengajuanPupuk) then) =
      _$PengajuanPupukCopyWithImpl<$Res, PengajuanPupuk>;
  @useResult
  $Res call({String idPengajuan, String desa});
}

/// @nodoc
class _$PengajuanPupukCopyWithImpl<$Res, $Val extends PengajuanPupuk>
    implements $PengajuanPupukCopyWith<$Res> {
  _$PengajuanPupukCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPengajuan = null,
    Object? desa = null,
  }) {
    return _then(_value.copyWith(
      idPengajuan: null == idPengajuan
          ? _value.idPengajuan
          : idPengajuan // ignore: cast_nullable_to_non_nullable
              as String,
      desa: null == desa
          ? _value.desa
          : desa // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PengajuanPupukImplCopyWith<$Res>
    implements $PengajuanPupukCopyWith<$Res> {
  factory _$$PengajuanPupukImplCopyWith(_$PengajuanPupukImpl value,
          $Res Function(_$PengajuanPupukImpl) then) =
      __$$PengajuanPupukImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idPengajuan, String desa});
}

/// @nodoc
class __$$PengajuanPupukImplCopyWithImpl<$Res>
    extends _$PengajuanPupukCopyWithImpl<$Res, _$PengajuanPupukImpl>
    implements _$$PengajuanPupukImplCopyWith<$Res> {
  __$$PengajuanPupukImplCopyWithImpl(
      _$PengajuanPupukImpl _value, $Res Function(_$PengajuanPupukImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPengajuan = null,
    Object? desa = null,
  }) {
    return _then(_$PengajuanPupukImpl(
      idPengajuan: null == idPengajuan
          ? _value.idPengajuan
          : idPengajuan // ignore: cast_nullable_to_non_nullable
              as String,
      desa: null == desa
          ? _value.desa
          : desa // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PengajuanPupukImpl implements _PengajuanPupuk {
  _$PengajuanPupukImpl({required this.idPengajuan, required this.desa});

  factory _$PengajuanPupukImpl.fromJson(Map<String, dynamic> json) =>
      _$$PengajuanPupukImplFromJson(json);

  @override
  final String idPengajuan;
  @override
  final String desa;

  @override
  String toString() {
    return 'PengajuanPupuk(idPengajuan: $idPengajuan, desa: $desa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PengajuanPupukImpl &&
            (identical(other.idPengajuan, idPengajuan) ||
                other.idPengajuan == idPengajuan) &&
            (identical(other.desa, desa) || other.desa == desa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idPengajuan, desa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PengajuanPupukImplCopyWith<_$PengajuanPupukImpl> get copyWith =>
      __$$PengajuanPupukImplCopyWithImpl<_$PengajuanPupukImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PengajuanPupukImplToJson(
      this,
    );
  }
}

abstract class _PengajuanPupuk implements PengajuanPupuk {
  factory _PengajuanPupuk(
      {required final String idPengajuan,
      required final String desa}) = _$PengajuanPupukImpl;

  factory _PengajuanPupuk.fromJson(Map<String, dynamic> json) =
      _$PengajuanPupukImpl.fromJson;

  @override
  String get idPengajuan;
  @override
  String get desa;
  @override
  @JsonKey(ignore: true)
  _$$PengajuanPupukImplCopyWith<_$PengajuanPupukImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
