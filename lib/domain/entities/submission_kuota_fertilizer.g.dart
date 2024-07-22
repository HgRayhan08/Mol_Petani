// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_kuota_fertilizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionKuotaFertilizerImpl _$$SubmissionKuotaFertilizerImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmissionKuotaFertilizerImpl(
      idDocument: json['idDocument'] as String?,
      idPPL: json['idPPL'] as String,
      idFarmerGroup: json['idFarmerGroup'] as String,
      idDistributor: json['idDistributor'] as String,
      year: json['year'] as String,
      send: (json['send'] as num).toInt(),
      information: json['information'] as String,
      sendDate: json['sendDate'] as String,
      acceptDate: json['acceptDate'] as String,
      leaderName: json['leaderName'] as String,
      nameDistributor: json['nameDistributor'] as String,
      nameFarmerGroup: json['nameFarmerGroup'] as String,
      nameAcceptFarmerGroup: json['nameAcceptFarmerGroup'] as String,
      nameSendDistributor: json['nameSendDistributor'] as String,
      sendUrea: (json['sendUrea'] as num).toInt(),
      sendPoska: (json['sendPoska'] as num).toInt(),
      acceptUrea: (json['acceptUrea'] as num).toInt(),
      acceptPoska: (json['acceptPoska'] as num).toInt(),
    );

Map<String, dynamic> _$$SubmissionKuotaFertilizerImplToJson(
        _$SubmissionKuotaFertilizerImpl instance) =>
    <String, dynamic>{
      'idDocument': instance.idDocument,
      'idPPL': instance.idPPL,
      'idFarmerGroup': instance.idFarmerGroup,
      'idDistributor': instance.idDistributor,
      'year': instance.year,
      'send': instance.send,
      'information': instance.information,
      'sendDate': instance.sendDate,
      'acceptDate': instance.acceptDate,
      'leaderName': instance.leaderName,
      'nameDistributor': instance.nameDistributor,
      'nameFarmerGroup': instance.nameFarmerGroup,
      'nameAcceptFarmerGroup': instance.nameAcceptFarmerGroup,
      'nameSendDistributor': instance.nameSendDistributor,
      'sendUrea': instance.sendUrea,
      'sendPoska': instance.sendPoska,
      'acceptUrea': instance.acceptUrea,
      'acceptPoska': instance.acceptPoska,
    };
