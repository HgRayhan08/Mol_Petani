// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_fertilizer_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataSubmissionGroupImpl _$$DataSubmissionGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$DataSubmissionGroupImpl(
      idGrupFarmers: json['idGrupFarmers'] as String,
      idPPL: json['idPPL'] as String,
      leaderName: json['leaderName'] as String,
      village: json['village'] as String,
      forYear: json['forYear'] as String,
      date: json['date'] as String,
      farmerFroup: json['farmerFroup'] as String,
      information: json['information'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$DataSubmissionGroupImplToJson(
        _$DataSubmissionGroupImpl instance) =>
    <String, dynamic>{
      'idGrupFarmers': instance.idGrupFarmers,
      'idPPL': instance.idPPL,
      'leaderName': instance.leaderName,
      'village': instance.village,
      'forYear': instance.forYear,
      'date': instance.date,
      'farmerFroup': instance.farmerFroup,
      'information': instance.information,
      'idDocument': instance.idDocument,
    };
