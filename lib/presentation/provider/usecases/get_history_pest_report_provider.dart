import 'package:mol_petani/domain/usecase/get_history_pest_report/get_hostory_pest_report.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_history_pest_report_provider.g.dart";

@riverpod
GetHistoryPestReport getHistoryPestReport(GetHistoryPestReportRef ref) =>
    GetHistoryPestReport(
        reportRepository: ref.watch(reportRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
