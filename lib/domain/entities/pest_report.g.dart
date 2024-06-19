// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PestReportImpl _$$PestReportImplFromJson(Map<String, dynamic> json) =>
    _$PestReportImpl(
      idPPL: json['idPPL'] as String,
      idFarmerGroup: json['idFarmerGroup'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      nameFarmerGroup: json['nameFarmerGroup'] as String,
      name: json['name'] as String,
      information: json['information'] as String,
      submissionDate: json['submissionDate'] as String,
      complateDate: json['complateDate'] as String,
      reporting: json['reporting'] as String,
      detailReporting: json['detailReporting'] as String,
      idDocument: json['idDocument'] as String?,
    );

Map<String, dynamic> _$$PestReportImplToJson(_$PestReportImpl instance) =>
    <String, dynamic>{
      'idPPL': instance.idPPL,
      'idFarmerGroup': instance.idFarmerGroup,
      'idUserFarmer': instance.idUserFarmer,
      'nameFarmerGroup': instance.nameFarmerGroup,
      'name': instance.name,
      'information': instance.information,
      'submissionDate': instance.submissionDate,
      'complateDate': instance.complateDate,
      'reporting': instance.reporting,
      'detailReporting': instance.detailReporting,
      'idDocument': instance.idDocument,
    };
