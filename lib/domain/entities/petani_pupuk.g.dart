// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petani_pupuk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetaniPupukImpl _$$PetaniPupukImplFromJson(Map<String, dynamic> json) =>
    _$PetaniPupukImpl(
      idKelompokTani: json['idKelompokTani'] as String,
      namaPetani: json['namaPetani'] as String,
      nik: json['nik'] as String,
      luasLahan: (json['luasLahan'] as num).toDouble(),
      fotoKtp: json['fotoKtp'] as String,
      fotoKK: json['fotoKK'] as String,
      fotoPajak: json['fotoPajak'] as String,
    );

Map<String, dynamic> _$$PetaniPupukImplToJson(_$PetaniPupukImpl instance) =>
    <String, dynamic>{
      'idKelompokTani': instance.idKelompokTani,
      'namaPetani': instance.namaPetani,
      'nik': instance.nik,
      'luasLahan': instance.luasLahan,
      'fotoKtp': instance.fotoKtp,
      'fotoKK': instance.fotoKK,
      'fotoPajak': instance.fotoPajak,
    };
