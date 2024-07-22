import 'package:mol_petani/domain/usecase/register_ppl/registrasi_ppl.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_ppl_provider.g.dart';

@riverpod
RegisterPpl registerPpl(RegisterPplRef ref) => RegisterPpl(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
