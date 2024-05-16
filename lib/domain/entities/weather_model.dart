import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherData with _$WeatherData {
  factory WeatherData({
    // required int queryCost,
    // required double latitude,
    // required double longitude,
    // required String resolvedAddress,
    // required String address,
    // required String timezone,
    // required int tzoffset,
    // String? description,
    // required List days,
    // List<dynamic>? alerts,
    // required Map stations,
    // List? currentConditions,

    required int queryCost,
    required double latitude,
    required double longitude,
    required String resolvedAddress,
    required String address,
    required String timezone,
    required int tzoffset,
    required List days,
    required Map<String, dynamic> stations,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
