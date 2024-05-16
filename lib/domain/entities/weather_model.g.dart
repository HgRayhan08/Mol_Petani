// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      queryCost: json['queryCost'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      resolvedAddress: json['resolvedAddress'] as String,
      address: json['address'] as String,
      timezone: json['timezone'] as String,
      tzoffset: json['tzoffset'] as int,
      days: json['days'] as List<dynamic>,
      stations: json['stations'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'queryCost': instance.queryCost,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'resolvedAddress': instance.resolvedAddress,
      'address': instance.address,
      'timezone': instance.timezone,
      'tzoffset': instance.tzoffset,
      'days': instance.days,
      'stations': instance.stations,
    };
