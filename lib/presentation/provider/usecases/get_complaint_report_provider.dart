import 'package:mol_petani/domain/usecase/get_complaint_report.dart/get_complaint_report.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_complaint_report_provider.g.dart";

@riverpod
GetComplaintReport getComplaintReport(GetComplaintReportRef ref) =>
    GetComplaintReport(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        monitoringReport: ref.watch(reportRepositoryProvider));
