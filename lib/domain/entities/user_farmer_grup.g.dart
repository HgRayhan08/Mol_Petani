// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_farmer_grup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFarmerGroupImpl _$$UserFarmerGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$UserFarmerGroupImpl(
      uid: json['uid'] as String,
      leaderName: json['leaderName'] as String,
      email: json['email'] as String,
      information: json['information'] as String,
      familyIdentificationNumber: json['familyIdentificationNumber'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      farmerGrup: json['farmerGrup'] as String,
      village: json['village'] as String,
      idPPL: json['idPPL'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$UserFarmerGroupImplToJson(
        _$UserFarmerGroupImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'leaderName': instance.leaderName,
      'email': instance.email,
      'information': instance.information,
      'familyIdentificationNumber': instance.familyIdentificationNumber,
      'fotoUrl': instance.fotoUrl,
      'farmerGrup': instance.farmerGrup,
      'village': instance.village,
      'idPPL': instance.idPPL,
      'mobileNumber': instance.mobileNumber,
    };
