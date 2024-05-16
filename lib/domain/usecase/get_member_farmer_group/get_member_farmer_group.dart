import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetMemberFarmerGroup implements UseCase<Result<List<UserFarmer>>, void> {
  final UserRepository userRepository;
  final SharedPrefRepository sharedPrefRepository;

  GetMemberFarmerGroup(
      {required this.userRepository, required this.sharedPrefRepository});
  @override
  Future<Result<List<UserFarmer>>> call(_) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    var result =
        await userRepository.getAllMemberFarmerGroup(idFarmerGroup: user![1]);
    return switch (result) {
      Success(value: final data) => Result.success(data),
      Failed(:final message) => Result.failed(message),
    };
  }
}
