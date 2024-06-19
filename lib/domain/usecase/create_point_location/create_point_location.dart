import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:mol_petani/data/repository/shered_pref_repository.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_point_location/point_location_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class CreatePointLocation
    implements UseCase<Result<AreaLocation>, PointLocationParams> {
  final MapsRepository mapsRepository;
  final SharedPrefRepository sharedPrefRepository;

  CreatePointLocation(
      {required this.mapsRepository, required this.sharedPrefRepository});
  @override
  Future<Result<AreaLocation>> call(PointLocationParams params) async {
    List<String>? user = await sharedPrefRepository.getDataLogin();
    // print(params.cordinatPoinnt);
    var result = await mapsRepository.createLocation(
      cordinatPoint: params.cordinatPoint,
      farmerName: params.farmerName,
      idPPL: user![1],
      idUserFarmer: params.idUserFarmer,
    );
    print("object 1");
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message),
    };
  }
}
