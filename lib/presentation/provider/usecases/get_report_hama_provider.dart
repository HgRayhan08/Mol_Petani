import 'package:mol_petani/domain/usecase/get_report_hama/get_report_hama.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_report_hama_provider.g.dart';

@riverpod
GetReportHama getReportHama(GetReportHamaRef ref) => GetReportHama(
    reportRepository: ref.watch(reportRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
