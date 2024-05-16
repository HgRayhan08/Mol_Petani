import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class ReportRepository {
  Future<Result<Report>> createReport({
    required String idGrupFarmer,
    required String idPPL,
    required String idFarmer,
    required String idDataFarmer,
    required String groupFarmer,
    required String nameFarmer,
    required String information,
    required String reporting,
    required String reportingDetail,
    required String submissionDate,
  });

  Future<Result<List<Report>>> getreport({required String idFarmer});
  Future<Result<List<Report>>> getReportFarmer({
    required String idPPL,
    required String information,
  });
}
