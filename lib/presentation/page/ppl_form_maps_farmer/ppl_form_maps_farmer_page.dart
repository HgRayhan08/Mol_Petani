import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';
import 'package:mol_petani/presentation/provider/submission_fertilizer/submission_fertilizer_provider.dart';

class PplFormMapsFarmerPage extends ConsumerStatefulWidget {
  final UserFarmer user;
  const PplFormMapsFarmerPage(this.user, {super.key});

  @override
  ConsumerState<PplFormMapsFarmerPage> createState() =>
      _PplFormMapsFarmerPageState();
}

class _PplFormMapsFarmerPageState extends ConsumerState<PplFormMapsFarmerPage> {
  // List<GeoPoint> dataLokasi = [
  //   GeoPoint(-7.636249, 112.215799),
  //   GeoPoint(-7.636280, 112.215870),
  //   GeoPoint(-7.637097, 112.215655),
  //   GeoPoint(-7.637065, 112.215575),
  // ];
  List<LatLng> pointMaps = [
    LatLng(-7.636249, 112.215799),
    LatLng(-7.636280, 112.215870),
    LatLng(-7.637097, 112.215655),
    LatLng(-7.637065, 112.215575),
  ];
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _addListpoint() {
    final lat = double.parse(latController.text);
    final long = double.parse(longController.text);

    if (lat != 0 && long != 0) {
      setState(() {
        // dataLokasi.add(GeoPoint(lat, long));
        pointMaps.add(LatLng(lat, long));
      });
      latController.clear();
      longController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextFormField(
            controller: latController,
            decoration: const InputDecoration(
              labelText: 'Latitude',
            ),
          ),
          TextFormField(
            controller: longController,
            decoration: const InputDecoration(
              labelText: 'Latitude',
            ),
          ),
          ElevatedButton(
            onPressed: _addListpoint,
            child: Text(
              "Add",
              style: buttonReguler,
            ),
          ),
          SizedBox(
            height: height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              options:
                  MapOptions(center: LatLng(-7.636249, 112.215799), zoom: 14),
              // nonRotatedChildren: [
              //   AttributionWidget.defaultWidget(
              //       source: 'OpenStreetMap contributers', onSourceTapped: null),
              // ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolygonLayer(polygons: [
                  Polygon(
                    points: pointMaps,
                    color: Colors.redAccent,
                    isFilled: true,
                  )
                ])
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // List<GeoPoint> geoPoints = dataLokasi
              //     .map((e) => GeoPoint(e.latitude, e.longitude))
              //     .toList();
              // print(dataLokasi);
              // print(pointMaps);
              ref.read(mapsProviderProvider.notifier).createLocationFarmer(
                  cordinat: pointMaps,
                  farmerName: widget.user.name,
                  idUserFarmer: widget.user.idUserFarmer);
            },
            child: Text(
              "Simpan",
              style: buttonReguler,
            ),
          ),
        ],
      ),
    );
  }
}
