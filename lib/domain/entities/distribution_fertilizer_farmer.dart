import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution_fertilizer_farmer.freezed.dart';
part 'distribution_fertilizer_farmer.g.dart';

@freezed
class DistributionFertilizerFarmer with _$DistributionFertilizerFarmer {
  factory DistributionFertilizerFarmer({
    String? idDocumennt,
    required String idPPL,
    required String idFarmerGroup,
    required String idUserFarmer,
    required String farmerName,
    required String year,
    required String distribution,
    required String information,
    required String distribusiDate,
    required String pickupDate,
    required String plant,
    required int ureaDistribution,
    required int poskaDistribution,
    required int ureaPickup,
    required int poskaPickup,
  }) = _DistributionFertilizerFarmer;

  factory DistributionFertilizerFarmer.fromJson(Map<String, dynamic> json) =>
      _$DistributionFertilizerFarmerFromJson(json);
}
