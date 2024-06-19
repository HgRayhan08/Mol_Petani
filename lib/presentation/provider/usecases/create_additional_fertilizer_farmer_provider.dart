import 'package:mol_petani/domain/usecase/create_additional_fertilizer_group/create_additional_fertilizer_group.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_additional_fertilizer_farmer_provider.g.dart";

@riverpod
CreateAdditionalFertilizerGroup createAdditionalFertilizerGroup(
        CreateAdditionalFertilizerGroupRef ref) =>
    CreateAdditionalFertilizerGroup(
      submissionFretilizerRepository: ref.watch(fertilizerRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
