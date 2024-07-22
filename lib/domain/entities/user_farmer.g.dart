// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_farmer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFarmerImpl _$$UserFarmerImplFromJson(Map<String, dynamic> json) =>
    _$UserFarmerImpl(
      idFarmerGroup: json['idFarmerGroup'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      idPPL: json['idPPL'] as String,
      name: json['name'] as String,
      information: json['information'] as String,
      farmerGroup: json['farmerGroup'] as String,
      alamat: json['alamat'] as String,
      email: json['email'] as String,
      noHp: json['noHp'] as String,
      nik: json['nik'] as String,
      luasLahan: json['luasLahan'] as String,
      jenisKelamin: json['jenisKelamin'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$UserFarmerImplToJson(_$UserFarmerImpl instance) =>
    <String, dynamic>{
      'idFarmerGroup': instance.idFarmerGroup,
      'idUserFarmer': instance.idUserFarmer,
      'idPPL': instance.idPPL,
      'name': instance.name,
      'information': instance.information,
      'farmerGroup': instance.farmerGroup,
      'alamat': instance.alamat,
      'email': instance.email,
      'noHp': instance.noHp,
      'nik': instance.nik,
      'luasLahan': instance.luasLahan,
      'jenisKelamin': instance.jenisKelamin,
      'idDocument': instance.idDocument,
    };
