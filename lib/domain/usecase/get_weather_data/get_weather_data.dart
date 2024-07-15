import 'package:intl/intl.dart';
import 'package:mol_petani/data/weather/open_weather_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';
import 'package:mol_petani/domain/usecase/get_weather_data/weather_data_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetWeatherData
    implements UseCase<Result<WeatherModel>, WeatherDataParams> {
  final OpenWeatherRepository weather;

  GetWeatherData({required this.weather});

  @override
  Future<Result<WeatherModel>> call(WeatherDataParams params) async {
    try {
      final dataWeather =
          await weather.feactWeather(params.latitude, params.longitude);
      if (dataWeather != null) {
        return Result.success(dataWeather);
      } else {
        return const Result.failed("No data available");
      }
    } catch (e) {
      return Result.failed("Failed to fetch weather data: $e");
    }
  }
}
