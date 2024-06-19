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
      idGroupFarmer: json['idGroupFarmer'] as String,
      idDistributor: json['idDistributor'] as String,
      information: json['information'] as String,
      year: json['year'] as String,
      send: (json['send'] as num).toInt(),
      sendDate: json['sendDate'] as String,
      acceptDate: json['acceptDate'] as String,
      leaderName: json['leaderName'] as String,
      nameDistributor: json['nameDistributor'] as String,
      nameGroupFarmer: json['nameGroupFarmer'] as String,
      nameAcceptGroupFarmer: json['nameAcceptGroupFarmer'] as String,
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
      'idGroupFarmer': instance.idGroupFarmer,
      'idDistributor': instance.idDistributor,
      'information': instance.information,
      'year': instance.year,
      'send': instance.send,
      'sendDate': instance.sendDate,
      'acceptDate': instance.acceptDate,
      'leaderName': instance.leaderName,
      'nameDistributor': instance.nameDistributor,
      'nameGroupFarmer': instance.nameGroupFarmer,
      'nameAcceptGroupFarmer': instance.nameAcceptGroupFarmer,
      'nameSendDistributor': instance.nameSendDistributor,
      'sendUrea': instance.sendUrea,
      'sendPoska': instance.sendPoska,
      'acceptUrea': instance.acceptUrea,
      'acceptPoska': instance.acceptPoska,
    };
