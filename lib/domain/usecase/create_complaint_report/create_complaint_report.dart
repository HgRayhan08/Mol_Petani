import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_complaint_report/create_report_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateComplaintReport
    implements UseCase<Result<Report>, CreateReportParams> {
  final ReportRepository monitoringReport;
  final SharedPrefRepository sharedPrefRepository;

  CreateComplaintReport(
      {required this.monitoringReport, required this.sharedPrefRepository});

  @override
  Future<Result<Report>> call(CreateReportParams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    DateTime date = DateTime.now();
    var report = await monitoringReport.createReport(
      idGrupFarmer: user![4],
      idPPL: user[2],
      idFarmer: user[1],
      groupFarmer: user[3],
      nameFarmer: user[5],
      information: "Submission",
      reporting: params.reporting,
      reportingDetail: params.reportingDetail,
      submissionDate: DateFormat("dd-MM-yyyy").format(date).toString(),
    );
    if (report.isSuccess) {
      return Result.success(report.resultValue!);
    } else {
      return const Result.failed("");
    }
  }
}
