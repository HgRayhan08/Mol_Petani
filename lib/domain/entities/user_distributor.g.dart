// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_distributor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDistrubutorImpl _$$UserDistrubutorImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDistrubutorImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      information: json['information'] as String,
      familyIdentificationNumber: json['familyIdentificationNumber'] as String,
      idPPL: json['idPPL'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      address: json['address'] as String,
      toko: json['toko'] as String,
      scope: json['scope'] as List<dynamic>? ?? const [],
      mobileNumber: (json['mobileNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDistrubutorImplToJson(
        _$UserDistrubutorImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'information': instance.information,
      'familyIdentificationNumber': instance.familyIdentificationNumber,
      'idPPL': instance.idPPL,
      'fotoUrl': instance.fotoUrl,
      'address': instance.address,
      'toko': instance.toko,
      'scope': instance.scope,
      'mobileNumber': instance.mobileNumber,
    };
