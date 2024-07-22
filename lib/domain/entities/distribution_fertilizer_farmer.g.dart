// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_fertilizer_farmer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistributionFertilizerFarmerImpl _$$DistributionFertilizerFarmerImplFromJson(
        Map<String, dynamic> json) =>
    _$DistributionFertilizerFarmerImpl(
      idDocumennt: json['idDocumennt'] as String?,
      idPPL: json['idPPL'] as String,
      idFarmerGroup: json['idFarmerGroup'] as String,
      idUserFarmer: json['idUserFarmer'] as String,
      farmerName: json['farmerName'] as String,
      year: json['year'] as String,
      distribution: json['distribution'] as String,
      information: json['information'] as String,
      distribusiDate: json['distribusiDate'] as String,
      pickupDate: json['pickupDate'] as String,
      plant: json['plant'] as String,
      ureaDistribution: (json['ureaDistribution'] as num).toInt(),
      poskaDistribution: (json['poskaDistribution'] as num).toInt(),
      ureaPickup: (json['ureaPickup'] as num).toInt(),
      poskaPickup: (json['poskaPickup'] as num).toInt(),
    );

Map<String, dynamic> _$$DistributionFertilizerFarmerImplToJson(
        _$DistributionFertilizerFarmerImpl instance) =>
    <String, dynamic>{
      'idDocumennt': instance.idDocumennt,
      'idPPL': instance.idPPL,
      'idFarmerGroup': instance.idFarmerGroup,
      'idUserFarmer': instance.idUserFarmer,
      'farmerName': instance.farmerName,
      'year': instance.year,
      'distribution': instance.distribution,
      'information': instance.information,
      'distribusiDate': instance.distribusiDate,
      'pickupDate': instance.pickupDate,
      'plant': instance.plant,
      'ureaDistribution': instance.ureaDistribution,
      'poskaDistribution': instance.poskaDistribution,
      'ureaPickup': instance.ureaPickup,
      'poskaPickup': instance.poskaPickup,
    };
