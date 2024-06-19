import 'package:mol_petani/domain/usecase/get_accept_fertilizer_farmer/get_acceptd_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/submission_repository/fertilizer_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_accept_fertilizer_farmer_provider.g.dart";

@riverpod
GetAcceptFertilizerFarmer getAcceptFertilizerFarmer(
        GetAcceptFertilizerFarmerRef ref) =>
    GetAcceptFertilizerFarmer(
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
        fertilizerRepository: ref.watch(fertilizerRepositoryProvider));
