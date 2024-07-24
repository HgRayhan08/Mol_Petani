import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

class MapsPage extends ConsumerStatefulWidget {
  const MapsPage({super.key});

  @override
  ConsumerState<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends ConsumerState<MapsPage> {
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maps Lokasi Sawah",
          style: largeReguler,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height -
                (AppBar().preferredSize.height * 2) -
                MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(-7.636249, 112.215799),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                FutureBuilder(
                  future: ref
                      .watch(mapsProviderProvider.notifier)
                      .getAllLocationFarmer(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isSuccess) {
                      var data = snapshot.data!.resultValue;
                      if (data == null || data.isEmpty) {
                        return const Center(
                          child: Text('No locations found'),
                        );
                      }

                      // Menggunakan PolygonLayer untuk menampilkan poligon
                      return PolygonLayer(
                        polygons: data.map((location) {
                          Color randomColor = getRandomColor();
                          return Polygon(
                            points: location.cordinatPoint,
                            color: randomColor.withOpacity(0.2),
                            borderColor: randomColor.withOpacity(0.2),
                            borderStrokeWidth: 3.0,
                            label: location.farmerName,
                            isFilled: true,
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: Text('Failed to load locations'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
