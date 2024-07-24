// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_fertilizer_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataSubmissionGroupImpl _$$DataSubmissionGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$DataSubmissionGroupImpl(
      idFarmerGroup: json['idFarmerGroup'] as String,
      idPPL: json['idPPL'] as String,
      leaderName: json['leaderName'] as String,
      village: json['village'] as String,
      forYear: json['forYear'] as String,
      date: json['date'] as String,
      farmerGroup: json['farmerGroup'] as String,
      information: json['information'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$DataSubmissionGroupImplToJson(
        _$DataSubmissionGroupImpl instance) =>
    <String, dynamic>{
      'idFarmerGroup': instance.idFarmerGroup,
      'idPPL': instance.idPPL,
      'leaderName': instance.leaderName,
      'village': instance.village,
      'forYear': instance.forYear,
      'date': instance.date,
      'farmerGroup': instance.farmerGroup,
      'information': instance.information,
      'idDocument': instance.idDocument,
    };
