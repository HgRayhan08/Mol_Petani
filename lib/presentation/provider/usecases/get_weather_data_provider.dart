import 'package:mol_petani/domain/usecase/get_weather_data/get_weather_data.dart';
import 'package:mol_petani/presentation/provider/repository/weather_repository/open_weather_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "get_weather_data_provider.g.dart";

@riverpod
GetWeatherData getWeatherData(GetWeatherDataRef ref) => GetWeatherData(
      weather: ref.watch(openWeatherRepositoryProvider),
    );
