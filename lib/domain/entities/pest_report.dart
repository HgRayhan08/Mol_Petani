import 'package:freezed_annotation/freezed_annotation.dart';

part 'pest_report.freezed.dart';
part 'pest_report.g.dart';

@freezed
class PestReport with _$PestReport {
  factory PestReport({
    required String idPPL,
    required String idFarmerGroup,
    required String idUserFarmer,
    required String nameFarmerGroup,
    required String name,
    required String information,
    required String submissionDate,
    required String complateDate,
    required String reporting,
    required String detailReporting,
    String? idDocument,
  }) = _PestReport;

  factory PestReport.fromJson(Map<String, dynamic> json) =>
      _$PestReportFromJson(json);
}
