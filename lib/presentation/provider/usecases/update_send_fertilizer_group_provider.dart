import 'package:mol_petani/domain/usecase/upate_send_fertilizer_group/update_send_fertilizer_group.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_send_fertilizer_group_provider.g.dart";

@riverpod
UpdateSendFertilizerGroup updateSendFertilizerGroup(
        UpdateSendFertilizerGroupRef ref) =>
    UpdateSendFertilizerGroup(
        submission: ref.watch(fertilizerRepositoryProvider));
