import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetAllFarmer implements UseCase<Result<List<UserFarmer>>, void> {
  final UserRepository userRepository;

  GetAllFarmer({required this.userRepository});

  @override
  Future<Result<List<UserFarmer>>> call(void _) async {
    var result = await userRepository.getAllFarmer();
    return switch (result) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message),
    };
  }
}
