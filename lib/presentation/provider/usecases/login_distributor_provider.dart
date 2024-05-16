import 'package:mol_petani/domain/usecase/all_login/login_distributor.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_distributor_provider.g.dart';

@riverpod
LoginDistributor loginDistributor(LoginDistributorRef ref) => LoginDistributor(
      authentication: ref.watch(authenticationProvider),
      userRepository: ref.watch(userRepositoryProvider),
      sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    );
