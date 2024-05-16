import 'package:dio/dio.dart';
import 'package:mol_petani/data/repository/weather_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';

class OpenWeatherRepository implements WeatherRepository {
  String key = "2Y7UXK6WU2QFNBBLRED74C9G4";
  String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";

  @override
  Future<Result<List<WeatherData>>> getWeatherData({
    required String latitude,
    required String longitude,
    required String date,
  }) async {
    try {
      final response =
          await Dio().get("$baseUrl/$latitude,$longitude/$date?key=$key");
      print("data");
      print(response);
      List<WeatherData> _data = (response.data as List)
          .map(
            (e) => WeatherData(
              queryCost: e["queryCost"],
              latitude: e["latitude"],
              longitude: e["longitude"],
              resolvedAddress: e["resolvedAddress"],
              address: e["address"],
              timezone: e["timezone"],
              tzoffset: e["tzoffset"],
              days: e["days"],
              stations: e["stations"],
            ),
          )
          .toList();
      return Result.success(_data);
    } on DioException catch (e) {
      return Result.failed(e.message.toString());
    }
  }
}
