import 'package:mol_petani/domain/usecase/get_submission_fertilizer_grup/get_submission_grup_fertilizer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_submission_fertilizer_provider.g.dart';

@riverpod
GetSubmissionGrupFertilizer getSubmissionFertilizerGrup(
        GetSubmissionFertilizerGrupRef ref) =>
    GetSubmissionGrupFertilizer(
      submissionFretilizerRepository:
          ref.watch(submissionFretilizerRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    );
