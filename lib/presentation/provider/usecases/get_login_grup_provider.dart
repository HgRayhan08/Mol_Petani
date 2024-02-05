import 'package:mol_petani/domain/usecase/get_login_grup/get_login_grup.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_login_grup_provider.g.dart';

@riverpod
GetLoginGrup getLoginGrup(GetLoginGrupRef ref) => GetLoginGrup(
    authenticationRef: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider),
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));
