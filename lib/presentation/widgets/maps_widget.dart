import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

class MapsWidget extends ConsumerStatefulWidget {
  final String idUserFarmer;
  bool? isDelete;
  final double width;
  MapsWidget(
      {super.key,
      required this.idUserFarmer,
      this.isDelete = false,
      required this.width});

  @override
  ConsumerState<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends ConsumerState<MapsWidget> {
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
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String? idDocument;
    return SizedBox(
      height: height * 0.3,
      width: widget.width,
      child: FutureBuilder(
        future: ref
            .watch(mapsProviderProvider.notifier)
            .getLocationFarmer(idUserFarmer: widget.idUserFarmer),
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
                            Color randomColor = getRandomColor();
                            idDocument = location.idDocument;
                            return Polygon(
                              points: location.cordinatPoint,
                              color: randomColor.withOpacity(0.2),
                              borderColor: randomColor.withOpacity(0.2),
                              borderStrokeWidth: 3.0,
                              isFilled: true,
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
                widget.isDelete == false
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
