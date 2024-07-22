import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_fertilizer_group.freezed.dart';
part 'submission_fertilizer_group.g.dart';

@freezed
class DataSubmissionGroup with _$DataSubmissionGroup {
  factory DataSubmissionGroup({
    required String idGrupFarmers,
    required String idPPL,
    required String leaderName,
    required String village,
    required String forYear,
    required String date,
    required String farmerFroup,
    required String information,
    String? idDocument,
  }) = _DataSubmissionGroup;

  factory DataSubmissionGroup.fromJson(Map<String, dynamic> json) =>
      _$DataSubmissionGroupFromJson(json);
}
