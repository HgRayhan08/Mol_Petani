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
      kecamatan: json['kecamatan'] as String?,
      kelompok: json['kelompok'] as String?,
      desa: json['desa'] as String?,
      idPPL: json['idPPL'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nama': instance.nama,
      'email': instance.email,
      'keterangan': instance.keterangan,
      'fotoUrl': instance.fotoUrl,
      'cangkupan': instance.cangkupan,
      'kecamatan': instance.kecamatan,
      'kelompok': instance.kelompok,
      'desa': instance.desa,
      'idPPL': instance.idPPL,
    };
