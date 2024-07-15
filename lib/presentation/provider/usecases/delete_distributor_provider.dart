import 'package:mol_petani/domain/usecase/detele_distributor/delete_distributor.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_distributor_provider.g.dart';

@riverpod
DeleteDistributor deleteDistributor(DeleteDistributorRef ref) =>
    DeleteDistributor(userRepository: ref.watch(userRepositoryProvider));
