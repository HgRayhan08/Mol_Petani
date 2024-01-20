import 'package:mol_petani/domain/usecase/auth_petugas/login_petugas/login_kelompok.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_kelompok_provider.g.dart';

@riverpod
LoginKelompok loginKelompok(LoginKelompokRef ref) => LoginKelompok(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
