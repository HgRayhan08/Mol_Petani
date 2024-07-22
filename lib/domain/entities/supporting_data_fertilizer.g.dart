// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supporting_data_fertilizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportingDataFertilizerImpl _$$SupportingDataFertilizerImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportingDataFertilizerImpl(
      idDocument: json['idDocument'] as String?,
      idPpl: json['idPpl'] as String,
      idFarmerGroup: json['idFarmerGroup'] as String,
      farmername: json['farmername'] as String,
      nik: json['nik'] as String,
      luasLahan: (json['luasLahan'] as num).toDouble(),
      fotoKtp: json['fotoKtp'] as String,
      fotoKK: json['fotoKK'] as String,
      fotoPajak: json['fotoPajak'] as String,
    );

Map<String, dynamic> _$$SupportingDataFertilizerImplToJson(
        _$SupportingDataFertilizerImpl instance) =>
    <String, dynamic>{
      'idDocument': instance.idDocument,
      'idPpl': instance.idPpl,
      'idFarmerGroup': instance.idFarmerGroup,
      'farmername': instance.farmername,
      'nik': instance.nik,
      'luasLahan': instance.luasLahan,
      'fotoKtp': instance.fotoKtp,
      'fotoKK': instance.fotoKK,
      'fotoPajak': instance.fotoPajak,
    };
