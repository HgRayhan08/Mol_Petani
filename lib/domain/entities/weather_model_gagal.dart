// // To parse this JSON data, do
// //
// //     final weatherModel = weatherModelFromJson(jsonString);

// import 'dart:convert';

// WeatherModel weatherModelFromJson(String str) =>
//     WeatherModel.fromJson(json.decode(str));

// String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

// class WeatherModel {
//   int queryCost;
//   double latitude;
//   double longitude;
//   String resolvedAddress;
//   String address;
//   String timezone;
//   int tzoffset;
//   String description;
//   List<CurrentConditions> days;
//   List<dynamic> alerts;
//   Map<String, Station> stations;
//   CurrentConditions currentConditions;

//   WeatherModel({
//     required this.queryCost,
//     required this.latitude,
//     required this.longitude,
//     required this.resolvedAddress,
//     required this.address,
//     required this.timezone,
//     required this.tzoffset,
//     required this.description,
//     required this.days,
//     required this.alerts,
//     required this.stations,
//     required this.currentConditions,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
//         queryCost: json["queryCost"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         resolvedAddress: json["resolvedAddress"],
//         address: json["address"],
//         timezone: json["timezone"],
//         tzoffset: json["tzoffset"],
//         description: json["description"],
//         days: List<CurrentConditions>.from(
//             json["days"].map((x) => CurrentConditions.fromJson(x))),
//         alerts: List<dynamic>.from(json["alerts"].map((x) => x)),
//         stations: Map.from(json["stations"])
//             .map((k, v) => MapEntry<String, Station>(k, Station.fromJson(v))),
//         currentConditions:
//             CurrentConditions.fromJson(json["currentConditions"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "queryCost": queryCost,
//         "latitude": latitude,
//         "longitude": longitude,
//         "resolvedAddress": resolvedAddress,
//         "address": address,
//         "timezone": timezone,
//         "tzoffset": tzoffset,
//         "description": description,
//         "days": List<dynamic>.from(days.map((x) => x.toJson())),
//         "alerts": List<dynamic>.from(alerts.map((x) => x)),
//         "stations": Map.from(stations)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "currentConditions": currentConditions.toJson(),
//       };
// }

// class CurrentConditions {
//   String datetime;
//   int datetimeEpoch;
//   double temp;
//   double feelslike;
//   double humidity;
//   double dew;
//   int precip;
//   int precipprob;
//   int snow;
//   int snowdepth;
//   dynamic preciptype;
//   double windgust;
//   double windspeed;
//   double winddir;
//   double pressure;
//   double visibility;
//   double cloudcover;
//   double solarradiation;
//   double solarenergy;
//   int uvindex;
//   String conditions;
//   String icon;
//   List<String> stations;
//   String source;
//   String? sunrise;
//   int? sunriseEpoch;
//   String? sunset;
//   int? sunsetEpoch;
//   int? moonphase;
//   double? tempmax;
//   double? tempmin;
//   double? feelslikemax;
//   double? feelslikemin;
//   int? precipcover;
//   int? severerisk;
//   String? description;
//   List<CurrentConditions>? hours;

//   CurrentConditions({
//     required this.datetime,
//     required this.datetimeEpoch,
//     required this.temp,
//     required this.feelslike,
//     required this.humidity,
//     required this.dew,
//     required this.precip,
//     required this.precipprob,
//     required this.snow,
//     required this.snowdepth,
//     required this.preciptype,
//     required this.windgust,
//     required this.windspeed,
//     required this.winddir,
//     required this.pressure,
//     required this.visibility,
//     required this.cloudcover,
//     required this.solarradiation,
//     required this.solarenergy,
//     required this.uvindex,
//     required this.conditions,
//     required this.icon,
//     required this.stations,
//     required this.source,
//     this.sunrise,
//     this.sunriseEpoch,
//     this.sunset,
//     this.sunsetEpoch,
//     this.moonphase,
//     this.tempmax,
//     this.tempmin,
//     this.feelslikemax,
//     this.feelslikemin,
//     this.precipcover,
//     this.severerisk,
//     this.description,
//     this.hours,
//   });

//   factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
//       CurrentConditions(
//         datetime: json["datetime"],
//         datetimeEpoch: json["datetimeEpoch"],
//         temp: json["temp"]?.toDouble(),
//         feelslike: json["feelslike"]?.toDouble(),
//         humidity: json["humidity"]?.toDouble(),
//         dew: json["dew"]?.toDouble(),
//         precip: json["precip"],
//         precipprob: json["precipprob"],
//         snow: json["snow"],
//         snowdepth: json["snowdepth"],
//         preciptype: json["preciptype"],
//         windgust: json["windgust"]?.toDouble(),
//         windspeed: json["windspeed"]?.toDouble(),
//         winddir: json["winddir"]?.toDouble(),
//         pressure: json["pressure"]?.toDouble(),
//         visibility: json["visibility"]?.toDouble(),
//         cloudcover: json["cloudcover"]?.toDouble(),
//         solarradiation: json["solarradiation"]?.toDouble(),
//         solarenergy: json["solarenergy"]?.toDouble(),
//         uvindex: json["uvindex"],
//         conditions: json["conditions"],
//         icon: json["icon"],
//         stations: List<String>.from(json["stations"].map((x) => x)),
//         source: json["source"],
//         sunrise: json["sunrise"],
//         sunriseEpoch: json["sunriseEpoch"],
//         sunset: json["sunset"],
//         sunsetEpoch: json["sunsetEpoch"],
//         moonphase: json["moonphase"],
//         tempmax: json["tempmax"]?.toDouble(),
//         tempmin: json["tempmin"]?.toDouble(),
//         feelslikemax: json["feelslikemax"]?.toDouble(),
//         feelslikemin: json["feelslikemin"]?.toDouble(),
//         precipcover: json["precipcover"],
//         severerisk: json["severerisk"],
//         description: json["description"],
//         hours: json["hours"] == null
//             ? []
//             : List<CurrentConditions>.from(
//                 json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "datetime": datetime,
//         "datetimeEpoch": datetimeEpoch,
//         "temp": temp,
//         "feelslike": feelslike,
//         "humidity": humidity,
//         "dew": dew,
//         "precip": precip,
//         "precipprob": precipprob,
//         "snow": snow,
//         "snowdepth": snowdepth,
//         "preciptype": preciptype,
//         "windgust": windgust,
//         "windspeed": windspeed,
//         "winddir": winddir,
//         "pressure": pressure,
//         "visibility": visibility,
//         "cloudcover": cloudcover,
//         "solarradiation": solarradiation,
//         "solarenergy": solarenergy,
//         "uvindex": uvindex,
//         "conditions": conditions,
//         "icon": icon,
//         "stations": List<dynamic>.from(stations.map((x) => x)),
//         "source": source,
//         "sunrise": sunrise,
//         "sunriseEpoch": sunriseEpoch,
//         "sunset": sunset,
//         "sunsetEpoch": sunsetEpoch,
//         "moonphase": moonphase,
//         "tempmax": tempmax,
//         "tempmin": tempmin,
//         "feelslikemax": feelslikemax,
//         "feelslikemin": feelslikemin,
//         "precipcover": precipcover,
//         "severerisk": severerisk,
//         "description": description,
//         "hours": hours == null
//             ? []
//             : List<dynamic>.from(hours!.map((x) => x.toJson())),
//       };
// }

// class Station {
//   int distance;
//   double latitude;
//   double longitude;
//   int useCount;
//   String id;
//   String name;
//   int quality;
//   int contribution;

//   Station({
//     required this.distance,
//     required this.latitude,
//     required this.longitude,
//     required this.useCount,
//     required this.id,
//     required this.name,
//     required this.quality,
//     required this.contribution,
//   });

//   factory Station.fromJson(Map<String, dynamic> json) => Station(
//         distance: json["distance"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         useCount: json["useCount"],
//         id: json["id"],
//         name: json["name"],
//         quality: json["quality"],
//         contribution: json["contribution"],
//       );

//   Map<String, dynamic> toJson() => {
//         "distance": distance,
//         "latitude": latitude,
//         "longitude": longitude,
//         "useCount": useCount,
//         "id": id,
//         "name": name,
//         "quality": quality,
//         "contribution": contribution,
//       };
// }
