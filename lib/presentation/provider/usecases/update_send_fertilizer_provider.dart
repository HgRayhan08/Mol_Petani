import 'package:mol_petani/domain/usecase/update_send_fertilizer/update_send_fertilizer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/submission_fertilizer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_send_fertilizer_provider.g.dart";

@riverpod
UpdateSendFertilizer updateSendFertilizer(UpdateSendFertilizerRef ref) =>
    UpdateSendFertilizer(
      submission: ref.watch(submissionFretilizerRepositoryProvider),
    );
