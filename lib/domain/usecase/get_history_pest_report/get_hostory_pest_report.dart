import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetHistoryPestReport implements UseCase<Result<List<PestReport>>, void> {
  final ReportRepository reportRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetHistoryPestReport(
      {required this.reportRepository, required this.sharedPrefRepository});

  @override
  Future<Result<List<PestReport>>> call(void params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await reportRepository.getReportHama(
      idPPL: user![1],
      information: "Terima",
    );
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
