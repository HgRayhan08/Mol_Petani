import 'package:intl/intl.dart';
import 'package:mol_petani/data/repository/report_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_report_hama/report_hama_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreateReportHama
    implements UseCase<Result<PestReport>, ReportHamaParams> {
  final UserRepository userRepository;
  final ReportRepository monitoringReport;
  final SharedPrefRepository sharedPrefRepository;

  CreateReportHama(
      {required this.userRepository,
      required this.monitoringReport,
      required this.sharedPrefRepository});

  @override
  Future<Result<PestReport>> call(ReportHamaParams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    final DateTime date = DateTime.now();
    var userFarmer =
        await userRepository.getUserFarmer(idUser: params.idUserFarmer);
    if (userFarmer.isSuccess) {
      var result = await monitoringReport.createReportHama(
          idPPL: user![2],
          idFarmerGroup: user[1],
          idUserFarmer: params.idUserFarmer,
          nameFarmerGroup: user[3],
          name: userFarmer.resultValue!.name,
          submissionDate: DateFormat("dd-mm-yy").format(date),
          reporting: params.reporting,
          detailReporting: params.detailReporting);
      return switch (result) {
        Success(value: final data) => Result.success(data),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return const Result.failed("Failed create report hama");
    }
  }
}
