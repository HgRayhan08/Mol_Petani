import 'package:latlong2/latlong.dart';

class PointLocationParams {
  final List<LatLng> cordinatPoint;
  final String farmerName;
  final String idUserFarmer;

  PointLocationParams(
      {required this.cordinatPoint,
      required this.farmerName,
      required this.idUserFarmer});
}
