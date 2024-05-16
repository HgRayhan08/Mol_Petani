import 'package:mol_petani/domain/entities/report.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_complaint_report/create_report_params.dart';
import 'package:mol_petani/domain/usecase/create_complaint_report/create_complaint_report.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report.dart/get_complaint_report.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report_farmer/get_complaint_report_farmer.dart';
import 'package:mol_petani/domain/usecase/get_complaint_report_farmer/information_complaint_params.dart';
import 'package:mol_petani/presentation/provider/usecases/create_complaint_report_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_complaint_report_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_complaint_report_provider.dart';
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
    var result =
        await report(InformationComplaintParams(information: "Submission"));
    if (result.isSuccess) {
      return result.resultValue!;
    } else {
      return [];
    }
  }
}
