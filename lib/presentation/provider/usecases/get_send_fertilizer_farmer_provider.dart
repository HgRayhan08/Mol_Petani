import 'package:mol_petani/domain/usecase/get_send_fertilizer_farmer/get_send_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_send_fertilizer_farmer_provider.g.dart";

@riverpod
GetSendFertilizerFarmer getSendFertilizerFarmer(
        GetSendFertilizerFarmerRef ref) =>
    GetSendFertilizerFarmer(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
