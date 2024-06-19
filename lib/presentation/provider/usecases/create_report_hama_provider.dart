import 'package:mol_petani/domain/usecase/create_report_hama/create_report_hama.dart';
import 'package:mol_petani/presentation/provider/repository/report_repository/report_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_report_hama_provider.g.dart";

@riverpod
CreateReportHama createReportHama(CreateReportHamaRef ref) => CreateReportHama(
    userRepository: ref.watch(userRepositoryProvider),
    monitoringReport: ref.watch(reportRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
