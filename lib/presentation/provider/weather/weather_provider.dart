import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mol_petani/domain/entities/result.dart';
import 'package:mol_petani/domain/entities/weather_model.dart';
import 'package:mol_petani/domain/entities/weather_model_gagal.dart';
import 'package:mol_petani/domain/usecase/get_weather_data/get_weather_data.dart';
import 'package:mol_petani/domain/usecase/get_weather_data/weather_data_params.dart';
import 'package:mol_petani/presentation/provider/usecases/get_weather_data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'weather_provider.g.dart';

@Riverpod(keepAlive: true)
class WeatherProvider extends _$WeatherProvider {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<bool> getPermissionPosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<Position> getCurrentPosition(context) async {
    final hasPermission = await getPermissionPosition(context);
    Position? _currentPosition;

    if (hasPermission == true) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        _currentPosition = position;
      }).catchError((e) {
        debugPrint(e);
      });
      return _currentPosition!;
    } else {
      return Position(
        longitude: 0,
        latitude: 0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );
    }
  }

  Future<Result<WeatherData>> getWeatherData(context) async {
    GetWeatherData weatherData = ref.read(getWeatherDataProvider);
    final position = await getCurrentPosition(context);
    // state = const AsyncLoading();
    var result = await weatherData(
      WeatherDataParams(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      ),
    );
    // print(result.resultValue);
    switch (result) {
      case Success():
        return Result.success(result.resultValue!.first);
      case Failed(:final message):
        return Result.failed(message);
      // return WeatherModel(
      //     queryCost: 0,
      //     latitude: 0,
      //     longitude: 0,
      //     resolvedAddress: "",
      //     address: "",
      //     timezone: "",
      //     tzoffset: 0,
      //     description: "",
      //     days: [],
      //     alerts: [],
      //     stations: {},
      //     currentConditions: CurrentConditions(
      //         datetime: "",
      //         datetimeEpoch: 0,
      //         temp: 0,
      //         feelslike: 0,
      //         humidity: 0,
      //         dew: 0,
      //         precip: 0,
      //         precipprob: 0,
      //         snow: 0,
      //         snowdepth: 0,
      //         preciptype: 0,
      //         windgust: 0,
      //         windspeed: 0,
      //         winddir: 0,
      //         pressure: 0,
      //         visibility: 0,
      //         cloudcover: 0,
      //         solarradiation: 0,
      //         solarenergy: 0,
      //         uvindex: 0,
      //         conditions: Conditions.OVERCAST,
      //         icon: Icon(),
      //         stations: [],
      //         source: Source.COMB));
    }
  }
}
