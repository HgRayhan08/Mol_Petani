import 'package:mol_petani/domain/usecase/get_login_distributor/get_login_distributor.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_petugas_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_login_distributor_provider.g.dart';

@riverpod
GetLoginDistributor getLoginDistributor(GetLoginDistributorRef ref) =>
    GetLoginDistributor(
        authentication: ref.watch(authenticationProvider),
        userRepository: ref.watch(userRepositoryPetugasProvider));
