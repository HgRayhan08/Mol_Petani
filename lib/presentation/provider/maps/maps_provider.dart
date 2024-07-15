import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/usecase/create_point_location/create_point_location.dart';
import 'package:mol_petani/domain/usecase/create_point_location/point_location_params.dart';
import 'package:mol_petani/domain/usecase/delete_point_location/delete_point_location.dart';
import 'package:mol_petani/domain/usecase/get_all_location_farmer/get_all_location_farmer.dart';
import 'package:mol_petani/domain/usecase/get_location_farmer/get_location_farmer.dart';
import 'package:mol_petani/presentation/provider/usecases/create_location_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/delete_point_location_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_all_location_farmer_provider.dart';
import 'package:mol_petani/presentation/provider/usecases/get_location_farmer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "maps_provider.g.dart";

@Riverpod(keepAlive: true)
class MapsProvider extends _$MapsProvider {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<Result<AreaLocation>> createLocationFarmer({
    required List<LatLng> cordinat,
    required String farmerName,
    required String idUserFarmer,
  }) async {
    CreatePointLocation point = ref.read(createPointLocationProvider);
    // print(cordinat);
    var result = await point(PointLocationParams(
        cordinatPoint: cordinat,
        farmerName: farmerName,
        idUserFarmer: idUserFarmer));
    return switch (result) {
      Success(value: final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }

  Future<Result<List<AreaLocation>>> getAllLocationFarmer() async {
    GetAllLocationFarmer data = ref.read(getAllLocationFarmerProvider);
    var result = await data(null);
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return const Result.failed("failed get data location");
    }
  }

  Future<Result<List<AreaLocation>>> getLocationFarmer(
      {required String idUserFarmer}) async {
    GetLocationFarmer data = ref.read(getLocationFarmerProvider);
    var result = await data(idUserFarmer);
    print(result.resultValue!.length);
    if (result.isSuccess) {
      return Result.success(result.resultValue!);
    } else {
      return const Result.failed("failed get data location");
    }
  }

  Future<String> deletepointLocaion({required String idDocument}) async {
    DeletePointLocation delete = ref.read(deletePointLocationProvider);
    var result = await delete(idDocument);
    switch (result) {
      case Success():
        return "success Delete";
      case Failed():
        return "failed Delete";
    }
  }
}
