import 'package:freezed_annotation/freezed_annotation.dart';

part 'supporting_data_fertilizer.freezed.dart';
part 'supporting_data_fertilizer.g.dart';

@freezed
class SupportingDataFertilizer with _$SupportingDataFertilizer {
  factory SupportingDataFertilizer({
    String? idDocument,
    required String idPpl,
    required String idSubmission,
    required String idFarmerGroup,
    required String farmername,
    required String nik,
    required double luasLahan,
    required String fotoKtp,
    required String fotoKK,
    required String fotoPajak,
  }) = _SupportingDataFertilizer;

  factory SupportingDataFertilizer.fromJson(Map<String, dynamic> json) =>
      _$SupportingDataFertilizerFromJson(json);
}
