import 'package:mol_petani/domain/usecase/delete_distribution_farmer/delete_distribution_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_distribution_fertilizer_provider.g.dart';

@riverpod
DeleteDistributionFarmer deleteDistributionFarmer(
        DeleteDistributionFarmerRef ref) =>
    DeleteDistributionFarmer(
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
