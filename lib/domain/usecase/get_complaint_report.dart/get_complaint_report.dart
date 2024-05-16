import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetComplaintReport implements UseCase<Result<List<Report>>, void> {
  final SharedPrefRepository sharedPrefRepository;
  final ReportRepository monitoringReport;

  GetComplaintReport({
    required this.sharedPrefRepository,
    required this.monitoringReport,
  });
  @override
  Future<Result<List<Report>>> call(void _) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await monitoringReport.getreport(idFarmer: user![1]);
    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
