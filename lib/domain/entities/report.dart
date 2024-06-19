import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  factory Report({
    String? idDocument,
    required String idGrupFarmer,
    required String idPPL,
    required String idFarmer,
    required String groupFarmer,
    required String nameFarmer,
    required String information,
    required String reporting,
    required String reportingDetail,
    required String submissionDate,
    required String acceptedDate,
    required String completionDate,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
