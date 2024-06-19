import 'package:mol_petani/domain/usecase/get_data_monitoring/get_data_monitoring.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_data_monitoring_provider.g.dart";

@riverpod
GetDataMonitoring getDataMonitoring(GetDataMonitoringRef ref) =>
    GetDataMonitoring(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
