// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      nama: json['nama'] as String,
      email: json['email'] as String,
      keterangan: json['keterangan'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      cangkupan: (json['cangkupan'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      kelompok: json['kelompok'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nama': instance.nama,
      'email': instance.email,
      'keterangan': instance.keterangan,
      'fotoUrl': instance.fotoUrl,
      'cangkupan': instance.cangkupan,
      'kelompok': instance.kelompok,
    };
