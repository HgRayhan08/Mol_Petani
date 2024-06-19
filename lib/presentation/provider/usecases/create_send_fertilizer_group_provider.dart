import 'package:mol_petani/domain/usecase/create_send_fertilizer_group/create_send_fertilizer_group.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_send_fertilizer_group_provider.g.dart";

@riverpod
CreateSendFertilizerGroup createSendFertilizerGroup(
        CreateSendFertilizerGroupRef ref) =>
    CreateSendFertilizerGroup(
        userRepository: ref.watch(userRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
