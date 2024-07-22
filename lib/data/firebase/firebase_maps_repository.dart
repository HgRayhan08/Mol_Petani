import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/data/repository/maps_repository.dart';
import 'package:mol_petani/domain/entities/area_location.dart';
import 'package:mol_petani/domain/entities/result.dart';

class FirebaseMapsRepository implements MapsRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseMapsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<AreaLocation>> createLocation({
    required List<LatLng> cordinatPoint,
    required String farmerName,
    required String idPPL,
    required String idUserFarmer,
  }) async {
    CollectionReference<Map<String, dynamic>> create =
        _firebaseFirestore.collection("Agricultural_Location_Data");

    List<GeoPoint> geoPoints = cordinatPoint
        .map((location) => GeoPoint(location.latitude, location.longitude))
        .toList();
    await create.doc().set({
      "cordinatPoint": geoPoints,
      "farmerName": farmerName,
      "idPPL": idPPL,
      "idUserFarmer": idUserFarmer,
    });
    DocumentSnapshot<Map<String, dynamic>> result = await create.doc().get();

    if (result.exists) {
      return Result.success(AreaLocation.fromJson(result.data()!));
    } else {
      return const Result.failed("Gagal Membuat pengajuan");
    }
  }

  @override
  Future<Result<List<AreaLocation>>> getAllLocation(
      {required String idPPL}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Agricultural_Location_Data");

    try {
      var result = await data.where("idPPL", isEqualTo: idPPL).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs.map(
            (e) {
              // Mengambil GeoPoint dan mengonversinya menjadi LatLng
              var points = (e["cordinatPoint"] as List<dynamic>).map((point) {
                GeoPoint geoPoint = point as GeoPoint;
                return LatLng(geoPoint.latitude, geoPoint.longitude);
              }).toList();

              return AreaLocation(
                farmerName: e["farmerName"],
                idUserFarmer: e["idUserFarmer"],
                idPPL: e["idPPL"],
                cordinatPoint: points,
              );
            },
          ).toList(),
        );
      } else {
        return const Result.failed("Failed to get data");
      }
    } catch (e) {
      return Result.failed("Error: $e");
    }
  }

  @override
  Future<Result<List<AreaLocation>>> getLocationFarmer({
    required String idUserFarmer,
  }) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Agricultural_Location_Data");

    try {
      var result =
          await data.where("idUserFarmer", isEqualTo: idUserFarmer).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs.map(
            (e) {
              // Mengambil GeoPoint dan mengonversinya menjadi LatLng
              var points = (e["cordinatPoint"] as List<dynamic>).map((point) {
                GeoPoint geoPoint = point as GeoPoint;
                return LatLng(geoPoint.latitude, geoPoint.longitude);
              }).toList();

              return AreaLocation(
                farmerName: e["farmerName"],
                idUserFarmer: e["idUserFarmer"],
                idPPL: e["idPPL"],
                cordinatPoint: points,
              );
            },
          ).toList(),
        );
      } else {
        return const Result.failed("Failed to get data");
      }
    } catch (e) {
      return Result.failed("Error: $e");
    }
  }

  @override
  Future<Result<String>> deleteLocation({required String idDocument}) async {
    CollectionReference<Map<String, dynamic>> data =
        _firebaseFirestore.collection("Agricultural_Location_Data");
    await data.doc(idDocument).delete();
    DocumentSnapshot<Map<String, dynamic>> result = await data.doc().get();
    if (result.exists) {
      return const Result.success('Document successfully deleted');
    } else {
      return const Result.failed('Failed to delete document');
    }
  }
}
