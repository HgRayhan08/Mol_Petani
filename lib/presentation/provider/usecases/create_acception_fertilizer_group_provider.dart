import 'package:mol_petani/domain/usecase/create_acception_fertilizer_group/create_acception_fertilizer_group.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_acception_fertilizer_group_provider.g.dart";

@riverpod
CreateAcceptionFertilizerGroup createAcceptionFertilizerGroup(
        CreateAcceptionFertilizerGroupRef ref) =>
    CreateAcceptionFertilizerGroup(
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
