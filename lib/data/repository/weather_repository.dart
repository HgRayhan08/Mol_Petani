import 'package:mol_petani/domain/entities/weather_model.dart';

abstract interface class WeatherRepository {
  Future<WeatherModel?> feactWeather(double lat, double long);
}
