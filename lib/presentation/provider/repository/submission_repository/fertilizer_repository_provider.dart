import 'package:mol_petani/data/firebase/firebase_fertilizer_repository.dart';
import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fertilizer_repository_provider.g.dart';

// @riverpod
// SubmissionFretilizerRepository submissionFretilizerRepository(
//         SubmissionFretilizerRepositoryRef ref) =>
//     FirebaseSubmissionFertilizerRepository();

// @riverpod
// FertilizerRepository fer(FretilizerRepositoryRef ref) =>
//     FirebaseFertilizerRepository();
@riverpod
FertilizerRepository fertilizerRepository(FertilizerRepositoryRef ref) =>
    FirebaseFertilizerRepository();
