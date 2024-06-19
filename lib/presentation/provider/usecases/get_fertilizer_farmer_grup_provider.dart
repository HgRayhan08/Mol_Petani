import 'package:mol_petani/domain/usecase/get_fertilizer_farmer_grup/get_fertilizer_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_fertilizer_farmer_grup_provider.g.dart';

@riverpod
GetFertilizerFarmerGrup getFertilizerFarmerGrup(
        GetFertilizerFarmerGrupRef ref) =>
    GetFertilizerFarmerGrup(
      submissionFretilizerRepository: ref.watch(fertilizerRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    );
