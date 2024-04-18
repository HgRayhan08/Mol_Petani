import 'package:mol_petani/domain/usecase/upate_accepted_group/update_accepted_group.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_accepted_group_provider.g.dart";

@riverpod
UpdateAcceptedGroup updateAcceptedGroup(UpdateAcceptedGroupRef ref) =>
    UpdateAcceptedGroup(
      submission: ref.watch(submissionFretilizerRepositoryProvider),
    );
