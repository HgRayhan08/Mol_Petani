import 'package:mol_petani/domain/usecase/create_fertilizer_farmer_grup/create_fertilizer_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_fertilizer_farmer_grup_provider.g.dart';

@riverpod
CreateFertilizerFarmerGrup createFertilizerFarmerGrup(
        CreateFertilizerFarmerGrupRef ref) =>
    CreateFertilizerFarmerGrup(
        pengajuanRepository: ref.watch(submissionFretilizerRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
