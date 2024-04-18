import 'package:mol_petani/domain/usecase/update_information_submission_distributor/update_submission_distributor.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_submission_distributor_provider.g.dart';

@riverpod
UpdateSubmissionDistributor updateSubmissionDistributor(
        UpdateSubmissionDistributorRef ref) =>
    UpdateSubmissionDistributor(
        submission: ref.watch(submissionFretilizerRepositoryProvider));
