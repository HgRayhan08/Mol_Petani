import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class ReportRepository {
  Future<Result<Report>> createReport({
    required String idGrupFarmer,
    required String idPPL,
    required String idFarmer,
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

  Future<Result<String>> updateStatusComplaint({required String idDocument});

  Future<Result<String>> deleteComplaint({required String idDocument});

  Future<Result<PestReport>> createReportHama({
    required String idPPL,
    required String idFarmerGroup,
    required String idUserFarmer,
    required String nameFarmerGroup,
    required String name,
    required String submissionDate,
    required String reporting,
    required String detailReporting,
  });

  Future<Result<List<PestReport>>> getSubmissionReportHama({
    required String idFarmerGroup,
    required String information,
  });

  Future<Result<List<PestReport>>> getReportHama({
    required String idPPL,
    required String information,
  });
  Future<Result<String>> updateStatusPestReport({required String idDocument});

    Future<Result<String>> deletePest({required String idDocument});
}
