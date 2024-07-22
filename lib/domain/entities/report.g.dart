// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      idDocument: json['idDocument'] as String?,
      idGrupFarmer: json['idGrupFarmer'] as String,
      idPPL: json['idPPL'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      farmerGroup: json['farmerGroup'] as String,
      nameFarmer: json['nameFarmer'] as String,
      information: json['information'] as String,
      reporting: json['reporting'] as String,
      detailReporting: json['detailReporting'] as String,
      submissionDate: json['submissionDate'] as String,
      completionDate: json['completionDate'] as String,
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'idDocument': instance.idDocument,
      'idGrupFarmer': instance.idGrupFarmer,
      'idPPL': instance.idPPL,
      'idUserFarmer': instance.idUserFarmer,
      'farmerGroup': instance.farmerGroup,
      'nameFarmer': instance.nameFarmer,
      'information': instance.information,
      'reporting': instance.reporting,
      'detailReporting': instance.detailReporting,
      'submissionDate': instance.submissionDate,
      'completionDate': instance.completionDate,
    };
