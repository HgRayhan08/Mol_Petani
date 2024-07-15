import 'dart:convert';

// Fungsi untuk mengonversi JSON string menjadi objek WeatherModel
WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi objek WeatherModel menjadi JSON string
String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Datum> data;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.data,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: (json["lat"] ?? 0.0).toDouble(),
        lon: (json["lon"] ?? 0.0).toDouble(),
        timezone: json["timezone"] ?? '',
        timezoneOffset: json["timezone_offset"] ?? 0,
        data:
            List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;

  Datum({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        dt: json["dt"] ?? 0,
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
        temp: (json["temp"] ?? 0.0).toDouble(),
        feelsLike: (json["feels_like"] ?? 0.0).toDouble(),
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        dewPoint: (json["dew_point"] ?? 0.0).toDouble(),
        uvi: (json["uvi"] ?? 0.0).toDouble(),
        clouds: json["clouds"] ?? 0,
        visibility: json["visibility"] ?? 0,
        windSpeed: (json["wind_speed"] ?? 0.0).toDouble(),
        windDeg: json["wind_deg"] ?? 0,
        weather: List<Weather>.from(
            json["weather"]?.map((x) => Weather.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] ?? 0,
        main: json["main"] ?? '',
        description: json["description"] ?? '',
        icon: json["icon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
