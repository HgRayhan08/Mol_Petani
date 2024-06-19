import 'package:mol_petani/domain/usecase/get_submission_farmer_group/get_submission_farmer_group.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_submission_farmer_group_provider.g.dart";

@riverpod
GetSubmissionFarmerGroup getSubmissionFarmerGroup(
        GetSubmissionFarmerGroupRef ref) =>
    GetSubmissionFarmerGroup(
        submissionFretilizerRepository: ref.watch(fertilizerRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
