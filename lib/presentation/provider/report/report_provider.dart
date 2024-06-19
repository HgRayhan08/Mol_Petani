import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/pest_report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_complaint_report/create_report_params.dart';
import 'package:mol_petani/domain/usecase/create_complaint_report/create_complaint_report.dart';
import 'package:mol_petani/domain/usecase/create_report_hama/create_report_hama.dart';
import 'package:mol_petani/domain/usecase/create_report_hama/report_hama_params.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report.dart/get_complaint_report.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report_farmer/get_complaint_report_farmer.dart';
import 'package:mol_petani/domain/usecase/get_history_pest_report/get_hostory_pest_report.dart';
import 'package:mol_petani/domain/usecase/get_history_submission_pest_report/get_history_submission_pest_report.dart';
import 'package:mol_petani/domain/usecase/get_report_hama/get_report_hama.dart';
import 'package:mol_petani/domain/usecase/get_submission_report_hama/get_submission_report_hama.dart';
import 'package:mol_petani/domain/usecase/update_status_complaint/update_status_complaint.dart';
import 'package:mol_petani/domain/usecase/update_status_pest_report/update_ststus_pest_report.dart';
import 'package:mol_petani/presentation/provider/usecases/create_complaint_report_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/create_report_hama_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_complaint_report_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_complaint_report_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_history_pest_report_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_history_submission_pest_report_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_report_hama_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_submission_report_hama_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_status_complaint_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/update_status_pest_report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

@Riverpod(keepAlive: true)
class ReportProvider extends _$ReportProvider {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<String> createReport({
    required String reporting,
    required String reportingDetail,
  }) async {
    CreateComplaintReport create = ref.read(createComplaintReportProvider);

    var result = await create(CreateReportParams(
        reporting: reporting, reportingDetail: reportingDetail));
    if (result case Success(value: _)) {
      return "Succses create report";
    } else {
      return "failed create report";
    }
  }

  Future<List<Report>> getComplaintReport() async {
    GetComplaintReport report = ref.read(getComplaintReportProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<Report>> getComplaintReportFarmer() async {
    GetComplaintReportFarmer report =
        ref.read(getComplaintReportFarmerProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<String> updateStatusComplaint({required String idDocument}) async {
    UpdateStstusComplaint report = ref.read(updateStstusComplaintProvider);
    var result = await report(idDocument);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return "Failed Update Data";
    }
  }

// Hama
  Future<String> createReportHama({
    required String reporting,
    required String detailReporting,
    required String idUserFarmer,
  }) async {
    CreateReportHama create = ref.read(createReportHamaProvider);

    var result = await create(ReportHamaParams(
      reporting: reporting,
      detailReporting: detailReporting,
      idUserFarmer: idUserFarmer,
    ));
    if (result case Success(value: _)) {
      return "Succses create report hama";
    } else {
      return "failed create report hama";
    }
  }

  Future<List<PestReport>> getReportHama() async {
    GetReportHama report = ref.read(getReportHamaProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<PestReport>> getSubmissionReportHama() async {
    GetSubmissionReportHama report = ref.read(getSubmissionReportHamaProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<PestReport>> getHistoryPestReport() async {
    GetHistoryPestReport report = ref.read(getHistoryPestReportProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<List<PestReport>> getHistorySubmissionPestReport() async {
    GetHistorySubmissionPestReport report =
        ref.read(getHistorySubmissionPestReportProvider);
    var result = await report(null);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }

  Future<String> updateStatusPest({required String idDocument}) async {
    UpdateStstusPestReport report = ref.read(updateStstusPestReportProvider);
    var result = await report(idDocument);
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return "Failed Update Data";
    }
  }
}
