import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetLocationFarmer implements UseCase<Result<List<AreaLocation>>, String> {
  final MapsRepository mapsRepository;

  GetLocationFarmer({
    required this.mapsRepository,
  });

  @override
  Future<Result<List<AreaLocation>>> call(String params) async {
    var result = await mapsRepository.getLocationFarmer(idUserFarmer: params);
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
