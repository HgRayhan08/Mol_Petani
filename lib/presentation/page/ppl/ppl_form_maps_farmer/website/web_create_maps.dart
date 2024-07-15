import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

class WebCreateMaps extends StatefulWidget {
  final UserFarmer user;
  final WidgetRef ref;
  final TextEditingController latController;
  final TextEditingController longController;
  final Function() addListpoint;
  final List<LatLng> pointMaps;
  const WebCreateMaps({
    super.key,
    required this.user,
    required this.ref,
    required this.latController,
    required this.longController,
    required this.addListpoint,
    required this.pointMaps,
  });

  @override
  State<WebCreateMaps> createState() => _WebCreateMapsState();
}

class _WebCreateMapsState extends State<WebCreateMaps> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.02,
      ),
      children: [
        Text(
          "Tambah Lokasi Petani",
          style: largeReguler.copyWith(fontWeight: FontWeight.bold),
        ),
        const Divider(),
        SizedBox(
          height: height * 0.02,
        ),
        TextFormField(
          controller: widget.latController,
          decoration: const InputDecoration(
            labelText: 'Latitude',
          ),
        ),
        TextFormField(
          controller: widget.longController,
          decoration: const InputDecoration(
            labelText: 'Latitude',
          ),
        ),
        SizedBox(height: height * 0.03),
        ElevatedButton(
          onPressed: widget.addListpoint,
          child: Text(
            "Add",
            style: buttonReguler,
          ),
        ),
        SizedBox(height: height * 0.03),
        SizedBox(
          height: height * 0.4,
          width: MediaQuery.of(context).size.width,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-7.636249, 112.215799),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              PolygonLayer(polygons: [
                Polygon(
                  points: widget.pointMaps,
                  color: Colors.redAccent,
                  isFilled: true,
                )
              ])
            ],
          ),
        ),
        SizedBox(height: height * 0.03),
        ElevatedButton(
          onPressed: () async {
            // List<GeoPoint> geoPoints = dataLokasi
            //     .map((e) => GeoPoint(e.latitude, e.longitude))
            //     .toList();
            // print(dataLokasi);
            // print(pointMaps);
            widget.ref.read(mapsProviderProvider.notifier).createLocationFarmer(
                cordinat: widget.pointMaps,
                farmerName: widget.user.name,
                idUserFarmer: widget.user.idUserFarmer);
          },
          child: Text(
            "Simpan",
            style: buttonReguler,
          ),
        ),
      ],
    );
  }
}
