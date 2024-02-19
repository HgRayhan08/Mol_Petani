// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_pengajuan_pupuk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataSubmissionFertilizerImpl _$$DataSubmissionFertilizerImplFromJson(
        Map<String, dynamic> json) =>
    _$DataSubmissionFertilizerImpl(
      idGrupFarmers: json['idGrupFarmers'] as String,
      leaderName: json['leaderName'] as String,
      village: json['village'] as String,
      forYear: json['forYear'] as String,
      date: json['date'] as String,
      grupFarmer: json['grupFarmer'] as String,
      keterangan: json['keterangan'] as String,
      pengajuan: json['pengajuan'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$DataSubmissionFertilizerImplToJson(
        _$DataSubmissionFertilizerImpl instance) =>
    <String, dynamic>{
      'idGrupFarmers': instance.idGrupFarmers,
      'leaderName': instance.leaderName,
      'village': instance.village,
      'forYear': instance.forYear,
      'date': instance.date,
      'grupFarmer': instance.grupFarmer,
      'keterangan': instance.keterangan,
      'pengajuan': instance.pengajuan,
      'idDocument': instance.idDocument,
    };
