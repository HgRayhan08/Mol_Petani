import 'package:mol_petani/domain/usecase/delete_send_fertilizer/delete_send_fertilizer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "delete_send_fertilizer_provider.g.dart";

@riverpod
DeleteSendFertilizer deleteSendFertilizer(DeleteSendFertilizerRef ref) =>
    DeleteSendFertilizer(
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
