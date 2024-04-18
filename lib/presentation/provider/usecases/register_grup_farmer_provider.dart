import 'package:mol_petani/domain/usecase/register_farmer_grup/registrasi_farmer_grup.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "register_grup_farmer_provider.g.dart";

@riverpod
RegisterFarmerGrup registerFarmerGrup(RegisterFarmerGrupRef ref) =>
    RegisterFarmerGrup(
        authentication: ref.watch(authenticationProvider),
        userRepository: ref.watch(userRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
