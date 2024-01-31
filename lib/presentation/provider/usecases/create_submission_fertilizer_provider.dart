import 'package:mol_petani/domain/usecase/create_submission_group_fertilizer/create_submission_fertilizer_grup.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_submission_fertilizer_provider.g.dart';

@riverpod
CreateSubmissionFertilizerGrup createSubmissionFertilizerGrup(
        CreateSubmissionFertilizerGrupRef ref) =>
    CreateSubmissionFertilizerGrup(
        pengajuanRepository: ref.watch(submissionFretilizerRepositoryProvider));
