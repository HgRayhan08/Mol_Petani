import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';

abstract interface class WeatherRepository {
  Future<Result<List<WeatherData>>> getWeatherData({
    required String latitude,
    required String longitude,
    required String date,
  });
}
