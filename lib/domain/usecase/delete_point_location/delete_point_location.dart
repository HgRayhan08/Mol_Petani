import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class DeletePointLocation implements UseCase<Result<String>, String> {
  final MapsRepository mapsRepository;
  DeletePointLocation({required this.mapsRepository});

  @override
  Future<Result<String>> call(String params) async {
    final result = await mapsRepository.deleteLocation(idDocument: params);
    return switch (result) {
      Success() => const Result.success("Document deleted successfully"),
      Failed(:final message) => Result.failed(message),
    };
  }
}
