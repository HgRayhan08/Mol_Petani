import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'area_location.freezed.dart';
part 'area_location.g.dart';

@freezed
class AreaLocation with _$AreaLocation {
  factory AreaLocation({
    required String farmerName,
    required String idUserFarmer,
    required String idPPL,
    String? idDocument,
    @LatLngConverter() required List<LatLng> point,
  }) = _AreaLocation;

  factory AreaLocation.fromJson(Map<String, dynamic> json) =>
      _$AreaLocationFromJson(json);
}

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(LatLng latLng) {
    return {
      'latitude': latLng.latitude,
      'longitude': latLng.longitude,
    };
  }
}

class LatLngListConverter
    implements JsonConverter<List<LatLng>, List<dynamic>> {
  const LatLngListConverter();

  @override
  List<LatLng> fromJson(List<dynamic> json) {
    return json
        .map((e) => LatLng((e as Map<String, dynamic>)['latitude'] as double,
            (e as Map<String, dynamic>)['longitude'] as double))
        .toList();
  }

  @override
  List<dynamic> toJson(List<LatLng> latLngList) {
    return latLngList
        .map((latLng) =>
            {'latitude': latLng.latitude, 'longitude': latLng.longitude})
        .toList();
  }
}
