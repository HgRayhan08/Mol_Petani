import 'package:mol_petani/domain/usecase/register_officer/registrasi_grup_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_petugas_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "register_grup_farmer_provider.g.dart";

@riverpod
RegisterGrupFarmer registerGrupFarmer(RegisterGrupFarmerRef ref) =>
    RegisterGrupFarmer(
      authentication: ref.watch(authenticationProvider),
      userRepository: ref.watch(userRepositoryPetugasProvider),
    );
