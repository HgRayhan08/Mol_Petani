// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AreaLocationImpl _$$AreaLocationImplFromJson(Map<String, dynamic> json) =>
    _$AreaLocationImpl(
      farmerName: json['farmerName'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      idPPL: json['idPPL'] as String,
      point: (json['point'] as List<dynamic>)
          .map((e) =>
              const LatLngConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AreaLocationImplToJson(_$AreaLocationImpl instance) =>
    <String, dynamic>{
      'farmerName': instance.farmerName,
      'idUserFarmer': instance.idUserFarmer,
      'idPPL': instance.idPPL,
      'point': instance.point.map(const LatLngConverter().toJson).toList(),
    };
