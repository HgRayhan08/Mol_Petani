import 'package:mol_petani/domain/usecase/get_distribution_group_farmer/get_distribution_group_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_distribution_group_farmer_provider.g.dart";

@riverpod
GetDistributionGroupFarmer getDistributionGroupFarmer(
        GetDistributionGroupFarmerRef ref) =>
    GetDistributionGroupFarmer(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
