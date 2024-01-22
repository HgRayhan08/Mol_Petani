import 'package:mol_petani/domain/usecase/auth_petugas/get_login_kelompok/get_login_kelompok.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_login_kelompok_provider.g.dart';

@riverpod
GetLoginKelompok getLoginKelompok(GetLoginKelompokRef ref) => GetLoginKelompok(
    authenticationRef: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
