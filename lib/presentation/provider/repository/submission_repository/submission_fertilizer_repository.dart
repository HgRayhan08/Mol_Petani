import 'package:mol_petani/data/firebase/firebase_submission_repository.dart';
import 'package:mol_petani/data/repository/submission_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_fertilizer_repository.g.dart';

@riverpod
SubmissionFretilizerRepository submissionFretilizerRepository(
        SubmissionFretilizerRepositoryRef ref) =>
    FirebaseSubmissionFertilizerRepository();
