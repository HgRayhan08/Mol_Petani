import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mol_petani/presentation/page/all_home_page/method/information_farmer.dart';
import 'package:mol_petani/presentation/provider/weather/weather_provider.dart';

class HomeFarmerPage extends ConsumerStatefulWidget {
  const HomeFarmerPage({super.key});

  @override
  ConsumerState<HomeFarmerPage> createState() => _HomeFarmerPageState();
}

class _HomeFarmerPageState extends ConsumerState<HomeFarmerPage> {
  Position? position;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: informationFarmer(ref, width, height),
      body: FutureBuilder(
          future: ref
              .watch(weatherProviderProvider.notifier)
              .getPermissionPosition(context),
          builder: (context, snapshot) {
            return FutureBuilder(
                future: ref
                    .watch(weatherProviderProvider.notifier)
                    .getWeatherData(context),
                builder: (context, positions) {
                  return Column(
                    children: [
                      Text("data"),
                      // Text(positions.data!.resultValue!.address),
                      // Text(positions.data!.toString()??"");
                      // Text(positions.data!.longitude.toString()),
                      // Text(positions.data!.latitude.toString()),
                    ],
                  );
                });
          }),
    );
  }
}
