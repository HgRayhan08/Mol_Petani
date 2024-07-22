// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ppl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPplImpl _$$UserPplImplFromJson(Map<String, dynamic> json) =>
    _$UserPplImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      information: json['information'] as String,
      nik: json['nik'] as String?,
      subdistrict: json['subdistrict'] as String?,
      scope:
          (json['scope'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$UserPplImplToJson(_$UserPplImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'fotoUrl': instance.fotoUrl,
      'information': instance.information,
      'nik': instance.nik,
      'subdistrict': instance.subdistrict,
      'scope': instance.scope,
    };
