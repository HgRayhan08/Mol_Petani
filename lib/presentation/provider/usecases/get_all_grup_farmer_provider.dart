import 'package:mol_petani/domain/usecase/get_grup_farmer/get_all_grup_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_all_grup_farmer_provider.g.dart";

@riverpod
GetAllGrupFarmer getAllGrupFarmer(GetAllGrupFarmerRef ref) => GetAllGrupFarmer(
    userRepository: ref.watch(userRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
