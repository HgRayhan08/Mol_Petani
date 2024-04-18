import 'package:mol_petani/domain/usecase/create_fertilizer_farmer/create_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_fertilizer_farmer_provider.g.dart";

@riverpod
CreateFertilizerFarmer createFertilizerFarmer(CreateFertilizerFarmerRef ref) =>
    CreateFertilizerFarmer(
      submissionFretilizerRepository:
          ref.watch(submissionFretilizerRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
