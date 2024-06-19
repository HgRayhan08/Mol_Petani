import 'package:mol_petani/domain/usecase/delete_member_farmer_group/delete_member_farmer_group.dart';
import 'package:mol_petani/presentation/provider/repository/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_member_farmer_group_provider.g.dart';

@riverpod
DeleteMemberFarmerGroup deleteMemberFarmerGroup(
        DeleteMemberFarmerGroupRef ref) =>
    DeleteMemberFarmerGroup(userRepository: ref.watch(userRepositoryProvider));
