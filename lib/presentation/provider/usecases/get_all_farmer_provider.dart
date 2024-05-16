import 'package:mol_petani/domain/usecase/get_farmer/get_all_farmer.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_all_farmer_provider.g.dart";

@riverpod
GetAllFarmer getAllFarmer(GetAllFarmerRef ref) => GetAllFarmer(
      userRepository: ref.watch(userRepositoryProvider),
    );
