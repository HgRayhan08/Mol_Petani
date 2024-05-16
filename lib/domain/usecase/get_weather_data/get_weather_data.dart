import 'package:intl/intl.dart';
import 'package:mol_petani/data/weather/open_weather_repository.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';
import 'package:mol_petani/domain/usecase/get_weather_data/weather_data_params.dart';
import 'package:mol_petani/domain/usecase/usecase.dart';

class GetWeatherData
    implements UseCase<Result<List<WeatherData>>, WeatherDataParams> {
  final OpenWeatherRepository weather;

  GetWeatherData({required this.weather});
  @override
  Future<Result<List<WeatherData>>> call(WeatherDataParams params) async {
    DateTime date = DateTime.now();
    print(" ini");
    var dataWeather = await weather.getWeatherData(
      latitude: params.latitude,
      longitude: params.longitude,
      date: DateFormat("yyyy-MM-dd").format(date).toString(),
    );
    // print("object");
    print(" ini adalah data $dataWeather");
    // if (dataWeather != null) {
    //   return Result.success(dataWeather);
    // } else {
    //   return Result.failed("message");
    // }
    switch (dataWeather) {
      case Success():
        return Result.success(dataWeather.resultValue!);
      case Failed():
        return Result.failed("message");
      // Success(value: final movieDetail) => Result.success(movieDetail),
      // Failed(:final message) => Result.failed(message)
    }
    // ;
    // if (dataWeather != "") {
    // return Result.success(dataWeather);
    // } else {
    // return const Result.failed("Failed get data");
    // }
  }
}
