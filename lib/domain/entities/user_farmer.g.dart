// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_farmer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFarmerImpl _$$UserFarmerImplFromJson(Map<String, dynamic> json) =>
    _$UserFarmerImpl(
      idGrupFarmer: json['idGrupFarmer'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      nama: json['nama'] as String,
      grupFarmer: json['grupFarmer'] as String,
      village: json['village'] as String,
      email: json['email'] as String,
      nik: json['nik'] as String,
      kartuKeluarga: json['kartuKeluarga'] as String,
      luasLahan: json['luasLahan'] as String,
      jenisKelamin: json['jenisKelamin'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$UserFarmerImplToJson(_$UserFarmerImpl instance) =>
    <String, dynamic>{
      'idGrupFarmer': instance.idGrupFarmer,
      'idUserFarmer': instance.idUserFarmer,
      'nama': instance.nama,
      'grupFarmer': instance.grupFarmer,
      'village': instance.village,
      'email': instance.email,
      'nik': instance.nik,
      'kartuKeluarga': instance.kartuKeluarga,
      'luasLahan': instance.luasLahan,
      'jenisKelamin': instance.jenisKelamin,
      'idDocument': instance.idDocument,
    };
