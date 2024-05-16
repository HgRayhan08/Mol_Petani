import 'package:mol_petani/domain/usecase/create_farmer/create_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_farmer_provider.g.dart';

@riverpod
CreateFarmer createFarmer(CreateFarmerRef ref) => CreateFarmer(
    sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider));
