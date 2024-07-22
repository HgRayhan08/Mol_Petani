// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_distributor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDistrubutorImpl _$$UserDistrubutorImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDistrubutorImpl(
      uid: json['uid'] as String,
      idPPL: json['idPPL'] as String,
      name: json['name'] as String,
      toko: json['toko'] as String,
      email: json['email'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      scope: json['scope'] as List<dynamic>? ?? const [],
      information: json['information'] as String,
      nik: json['nik'] as String,
      alamat: json['alamat'] as String,
      noHp: (json['noHp'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDistrubutorImplToJson(
        _$UserDistrubutorImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'idPPL': instance.idPPL,
      'name': instance.name,
      'toko': instance.toko,
      'email': instance.email,
      'fotoUrl': instance.fotoUrl,
      'scope': instance.scope,
      'information': instance.information,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'noHp': instance.noHp,
    };
