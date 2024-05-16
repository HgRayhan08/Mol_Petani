import 'package:mol_petani/domain/usecase/create_complaint_report/create_complaint_report.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_complaint_report_provider.g.dart";

@riverpod
CreateComplaintReport createComplaintReport(CreateComplaintReportRef ref) =>
    CreateComplaintReport(
        monitoringReport: ref.watch(reportRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
