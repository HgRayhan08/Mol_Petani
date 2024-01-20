import 'package:mol_petani/domain/usecase/auth_petugas/register_petugas/register_petugas.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "register_petugas_provider.g.dart";

@riverpod
RegisterPetugas registerPetugas(RegisterPetugasRef ref) => RegisterPetugas(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
