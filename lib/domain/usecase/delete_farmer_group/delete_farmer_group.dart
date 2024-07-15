import 'package:mol_petani/data/repository/user_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeleteFarmerGroup implements UseCase<Result<String>, String> {
  final UserRepository userRepository;

  DeleteFarmerGroup({required this.userRepository});

  @override
  Future<Result<String>> call(String params) async {
    final result = await userRepository.deleteFarmerGroup(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Document deleted successfully"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
