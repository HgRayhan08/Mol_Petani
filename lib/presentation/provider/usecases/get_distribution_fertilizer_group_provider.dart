import 'package:mol_petani/domain/usecase/get_distribution_fertilizer_group/get_distribution_fertilizer_group.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_distribution_fertilizer_group_provider.g.dart";

@riverpod
GetDistributionFertilizerGroup getDistributionFertilizerGroup(
        GetDistributionFertilizerGroupRef ref) =>
    GetDistributionFertilizerGroup(
        submission: ref.watch(fertilizerRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
