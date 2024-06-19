import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

class MapsWidget extends ConsumerWidget {
  final String idUserFarmer;
  const MapsWidget({super.key, required this.idUserFarmer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
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
                .getLocationFarmer(idUserFarmer: idUserFarmer),
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
                  polygons: data.map(
                    (location) {
                      return Polygon(
                        points: location.point,
                        color: Colors.redAccent,
                        borderColor: Colors.redAccent,
                        borderStrokeWidth: 3.0,
                        label: location.farmerName,
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                      );
                    },
                  ).toList(),
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
    );
  }
}
