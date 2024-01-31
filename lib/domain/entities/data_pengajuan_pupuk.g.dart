// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_pengajuan_pupuk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataPengajuanPupukImpl _$$DataPengajuanPupukImplFromJson(
        Map<String, dynamic> json) =>
    _$DataPengajuanPupukImpl(
      idKelompoktani: json['idKelompoktani'] as String,
      namaKetua: json['namaKetua'] as String,
      desa: json['desa'] as String,
      forYear: json['forYear'] as String,
      tanggal: json['tanggal'] as String,
      petaniPupuk: (json['petaniPupuk'] as List<dynamic>?)
              ?.map((e) => PetaniPupuk.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$DataPengajuanPupukImplToJson(
        _$DataPengajuanPupukImpl instance) =>
    <String, dynamic>{
      'idKelompoktani': instance.idKelompoktani,
      'namaKetua': instance.namaKetua,
      'desa': instance.desa,
      'forYear': instance.forYear,
      'tanggal': instance.tanggal,
      'petaniPupuk': instance.petaniPupuk,
      'idDocument': instance.idDocument,
    };
