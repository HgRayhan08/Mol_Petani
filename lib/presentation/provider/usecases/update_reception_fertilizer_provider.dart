import 'package:mol_petani/domain/usecase/upate_reception_fertilizer/update_reception_fertilizer.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_reception_fertilizer_provider.g.dart';

@riverpod
UpdateReceptionFertilizer updateReceptionFertilizer(
        UpdateReceptionFertilizerRef ref) =>
    UpdateReceptionFertilizer(
        submission: ref.watch(fertilizerRepositoryProvider));
