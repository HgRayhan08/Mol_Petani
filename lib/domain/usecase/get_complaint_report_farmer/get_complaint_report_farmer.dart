import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report_farmer/information_complaint_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetComplaintReportFarmer
    implements UseCase<Result<List<Report>>, InformationComplaintParams> {
  final SharedPrefRepository sharedPrefRepository;
  final ReportRepository monitoringReport;

  GetComplaintReportFarmer({
    required this.sharedPrefRepository,
    required this.monitoringReport,
  });
  @override
  Future<Result<List<Report>>> call(InformationComplaintParams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result = await monitoringReport.getReportFarmer(
        idPPL: user![1], information: params.information);
    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
