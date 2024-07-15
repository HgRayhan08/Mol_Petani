import 'package:dio/dio.dart';
import 'package:mol_petani/data/repository/weather_repository.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';

class OpenWeatherRepository implements WeatherRepository {
  Future<WeatherModel?> feactWeather(double lat, double long) async {
    try {
      final response = await Dio().get(
          "https://api.openweathermap.org/data/3.0/onecall/timemachine?lat=$lat&lon=$long&dt=1643803200&appid=56709fad06fcd50734c856830771bfa3");

      // return WeatherModel.fromJson(response.data);
      if (response.data != null) {
        return WeatherModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
