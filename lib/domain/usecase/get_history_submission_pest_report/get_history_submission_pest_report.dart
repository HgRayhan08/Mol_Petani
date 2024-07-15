import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetHistorySubmissionPestReport
    implements UseCase<Result<List<Report>>, void> {
  final ReportRepository reportRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetHistorySubmissionPestReport({
    required this.reportRepository,
    required this.sharedPrefRepository,
  });

  @override
  Future<Result<List<Report>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await reportRepository.getReportFarmer(
      idPPL: user![1],
      information: "Terima",
    );
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
