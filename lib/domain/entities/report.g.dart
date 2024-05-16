// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      idGrupFarmer: json['idGrupFarmer'] as String,
      idPPL: json['idPPL'] as String,
      idFarmer: json['idFarmer'] as String,
      groupFarmer: json['groupFarmer'] as String,
      nameFarmer: json['nameFarmer'] as String,
      information: json['information'] as String,
      reporting: json['reporting'] as String,
      reportingDetail: json['reportingDetail'] as String,
      submissionDate: json['submissionDate'] as String,
      acceptedDate: json['acceptedDate'] as String,
      completionDate: json['completionDate'] as String,
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'idGrupFarmer': instance.idGrupFarmer,
      'idPPL': instance.idPPL,
      'idFarmer': instance.idFarmer,
      'groupFarmer': instance.groupFarmer,
      'nameFarmer': instance.nameFarmer,
      'information': instance.information,
      'reporting': instance.reporting,
      'reportingDetail': instance.reportingDetail,
      'submissionDate': instance.submissionDate,
      'acceptedDate': instance.acceptedDate,
      'completionDate': instance.completionDate,
    };
