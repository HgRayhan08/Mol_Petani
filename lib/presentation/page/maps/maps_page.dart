// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';

// class MapsPage extends ConsumerStatefulWidget {
//   const MapsPage({super.key});

//   @override
//   ConsumerState<MapsPage> createState() => _MapsPageState();
// }

// class _MapsPageState extends ConsumerState<MapsPage> {
//   List<Polygon> Polygons = [
//     Polygon(
//       points: const [
//         // lokasi desa sukoiber
//         // LatLng(-7.636249, 112.215799),
//         // LatLng(-7.636280, 112.215870),
//         // LatLng(-7.637097, 112.215655),
//         // LatLng(-7.637065, 112.215575),
//         // lokasi asli
//         LatLng(51.5251217665913, -0.08750429301284157),
//         LatLng(51.52472895081553, -0.08759899699452944),
//         LatLng(51.52334424817988, -0.08734645304377864),
//         LatLng(51.52229341736876, -0.08707812509587143),
//         LatLng(51.52165505036376, -0.0870465571028376),
//         LatLng(51.52059435924525, -0.08723596506618492),
//         LatLng(51.52045686043991, -0.08723596506618492),
//         LatLng(51.52025061145315, -0.08523139745747699),
//         LatLng(51.52126220468193, -0.0848367975335691),
//         LatLng(51.521213098733455, -0.08355829378393764),
//         LatLng(51.52200860857974, -0.08332153382906426)
//       ],
//       // label: "Lokasi",
//       color: Colors.redAccent,
//       isFilled: true,
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Maps Lokasi Sawah"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: height * 0.8,
//             width: MediaQuery.of(context).size.width,
//             child: FlutterMap(
//               options: const MapOptions(
//                   initialCenter: LatLng(-7.636249, 112.215799),
//                   initialZoom: 14),
//               children: [
//                 TileLayer(
//                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'com.example.app',
//                 ),
//                 FutureBuilder(
//                   future: ref
//                       .watch(mapsProviderProvider.notifier)
//                       .getLocationFarmer(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       var data = snapshot.data!.resultValue;
//                       return ListView.builder(
//                         itemBuilder: (context, index) {
//                           return PolygonLayer(
//                             polygons: [
//                               Polygon(
//                                 points: data![index].point,
//                                 label: data[index].farmerName,
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     } else {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
                AppBar().preferredSize.height -
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
                          return Polygon(
                            points: location.point,
                            color: Colors.redAccent,
                            borderColor: Colors.redAccent,
                            borderStrokeWidth: 3.0,
                            label: location.farmerName,
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
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
