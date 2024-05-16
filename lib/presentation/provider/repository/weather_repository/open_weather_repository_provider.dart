import 'package:mol_petani/data/weather/open_weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "open_weather_repository_provider.g.dart";

@riverpod
OpenWeatherRepository openWeatherRepository(OpenWeatherRepositoryRef ref) =>
    OpenWeatherRepository();
