import 'package:mol_petani/domain/usecase/create_fertilizer_kuota/create_submission_kuota_fertilizer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_fertilizer_kuota_provider.g.dart';

@riverpod
CreateFertilizerKuota createFertilizerKuota(CreateFertilizerKuotaRef ref) =>
    CreateFertilizerKuota(
      submission: ref.watch(submissionFretilizerRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    );
