import 'package:mol_petani/domain/usecase/delete_farmer/delete_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_farmer_provider.g.dart';

@riverpod
DeleteFarmer deleteFarmer(DeleteFarmerRef ref) =>
    DeleteFarmer(userRepository: ref.watch(userRepositoryProvider));
