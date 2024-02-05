import 'package:mol_petani/domain/usecase/get_all_distributor/get_all_distributor.dart';
import 'package:mol_petani/presentation/provider/repository/shared_pref_repository/shared_pref_repository_provider.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_all_distributor_provider.g.dart";

@riverpod
GetAllDistributor getAllDistributor(GetAllDistributorRef ref) =>
    GetAllDistributor(
        userRepository: ref.watch(userRepositoryProvider),
        sharedPrefRepository: ref.watch(sharedPrefRepositoryProvider));