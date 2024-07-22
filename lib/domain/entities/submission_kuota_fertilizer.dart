import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_kuota_fertilizer.freezed.dart';
part 'submission_kuota_fertilizer.g.dart';

@freezed
class SubmissionKuotaFertilizer with _$SubmissionKuotaFertilizer {
  factory SubmissionKuotaFertilizer({
    String? idDocument,
    required String idPPL,
    required String idFarmerGroup,
    required String idDistributor,
    required String year,
    required int send,
    required String information,
    required String sendDate,
    required String acceptDate,
    required String leaderName,
    required String nameDistributor,
    required String nameFarmerGroup,
    required String nameAcceptFarmerGroup,
    required String nameSendDistributor,
    required int sendUrea,
    required int sendPoska,
    required int acceptUrea,
    required int acceptPoska,
  }) = _SubmissionKuotaFertilizer;

  factory SubmissionKuotaFertilizer.fromJson(Map<String, dynamic> json) =>
      _$SubmissionKuotaFertilizerFromJson(json);
}
