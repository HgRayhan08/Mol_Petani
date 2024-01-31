import 'package:mol_petani/domain/usecase/logout_officer/logout.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "logout_petugas_provider.g.dart";

@riverpod
Logout logout(LogoutRef ref) => Logout(
      authentication: ref.watch(authenticationProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    );
