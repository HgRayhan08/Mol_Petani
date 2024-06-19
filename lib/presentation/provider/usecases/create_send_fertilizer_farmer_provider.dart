import 'package:mol_petani/domain/usecase/create_send_fertilizer_farmer/create_send_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "create_send_fertilizer_farmer_provider.g.dart";

@riverpod
CreateSendFertilizerFarmer createSendFertilizerFarmer(
        CreateSendFertilizerFarmerRef ref) =>
    CreateSendFertilizerFarmer(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
