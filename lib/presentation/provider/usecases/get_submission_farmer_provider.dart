import 'package:mol_petani/domain/usecase/get_submission_fertilizer_farmer/get_submition_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_submission_farmer_provider.g.dart";

@riverpod
GetSubmissionFarmer getSubmissionFarmer(GetSubmissionFarmerRef ref) =>
    GetSubmissionFarmer(
        submissionFretilizerRepository:
            ref.watch(submissionFretilizerRepositoryProvider));
