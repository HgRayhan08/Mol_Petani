import 'package:mol_petani/domain/usecase/create_submission_fertilizer_farmer/create_submission_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_fertilizer_farmer_provider.g.dart";

@riverpod
CreateSubmissionFarmer createSubmissionFarmer(CreateSubmissionFarmerRef ref) =>
    CreateSubmissionFarmer(
        submissionFretilizerRepository:
            ref.watch(submissionFretilizerRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
