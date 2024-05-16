import 'package:mol_petani/domain/usecase/update_account_farmer/update_account_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/authentication/authentication_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "update_account_farmer_provider.g.dart";

@riverpod
UpdateAccountFarmer updateAccountFarmer(UpdateAccountFarmerRef ref) =>
    UpdateAccountFarmer(
      userRepository: ref.watch(userRepositoryProvider),
      authentication: ref.watch(authenticationProvider),
    );
