import 'package:mol_petani/data/repository/fertilizer_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeleteDistributionFarmer implements UseCase<Result<String>, String> {
  final FertilizerRepository fertilizerRepository;

  DeleteDistributionFarmer({required this.fertilizerRepository});

  @override
  Future<Result<String>> call(String params) async {
    final result =
        await fertilizerRepository.deletedistributor(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Document deleted successfully"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
