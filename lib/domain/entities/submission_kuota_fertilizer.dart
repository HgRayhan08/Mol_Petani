import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_kuota_fertilizer.freezed.dart';
part 'submission_kuota_fertilizer.g.dart';

@freezed
class SubmissionKuotaFertilizer with _$SubmissionKuotaFertilizer {
  factory SubmissionKuotaFertilizer({
    String? idDocument,
    required String idUserGrup,
    required String idPPL,
    required String idSubmission,
    required String leaderName,
    required String pplName,
    required String distributorName,
    required String senderName,
    required String recipientName,
    required String sendNameDistributor,
    required String recipientNameSender,
    required String grupFarmer,
    required String village,
    required int submission,
    required String information,
    required String informationSend,
    required String dateOfFilling,
    required String prosesDate,
    required String reciptDate,
    required String dateSend,
    required String forYear,
    required int ureaSubmission,
    required int poskaSubmission,
    required int ureaReceived,
    required int poskaReceived,
    required int poskasend,
    required int ureaSend,
  }) = _SubmissionKuotaFertilizer;

  factory SubmissionKuotaFertilizer.fromJson(Map<String, dynamic> json) =>
      _$SubmissionKuotaFertilizerFromJson(json);
}
