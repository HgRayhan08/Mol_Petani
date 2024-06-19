import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';

abstract interface class MapsRepository {
  Future<Result<AreaLocation>> createLocation({
    required List<LatLng> cordinatPoint,
    required String farmerName,
    required String idPPL,
    required String idUserFarmer,
  });

  Future<Result<List<AreaLocation>>> getAllLocation({required String idPPL});

  Future<Result<List<AreaLocation>>> getLocationFarmer(
      {required String idUserFarmer});
}
