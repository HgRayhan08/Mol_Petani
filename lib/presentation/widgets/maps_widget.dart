import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

class MapsWidget extends ConsumerWidget {
  final String idUserFarmer;
  bool? isDelete;
  final double width;
  MapsWidget(
      {super.key,
      required this.idUserFarmer,
      this.isDelete = false,
      required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String? idDocument;
    return SizedBox(
      height: height * 0.3,
      width: width,
      child: FutureBuilder(
        future: ref
            .watch(mapsProviderProvider.notifier)
            .getLocationFarmer(idUserFarmer: idUserFarmer),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Data Tidak Tersedia',
                style: largeReguler,
              ),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data!.resultValue!;

            return Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(-7.636249, 112.215799),
                      initialZoom: 14,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      PolygonLayer(
                        polygons: data.map(
                          (location) {
                            idDocument = location.idDocument;
                            return Polygon(
                              points: location.cordinatPoint,
                              color: Colors.redAccent.withOpacity(0.5),
                              borderColor: Colors.redAccent,
                              borderStrokeWidth: 3.0,
                              label: location.farmerName,
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                isDelete == false
                    ? ElevatedButton(
                        onPressed: () {
                          if (idDocument != null) {
                            ref
                                .read(mapsProviderProvider.notifier)
                                .deletepointLocaion(idDocument: idDocument!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No document to delete."),
                              ),
                            );
                          }
                        },
                        child: const Text("Hapus Data"),
                      )
                    : Container(),
              ],
            );
          } else {
            return const Center(child: Text("Data Tidak Dapat ditampilkan"));
          }
        },
      ),
    );
  }
}
