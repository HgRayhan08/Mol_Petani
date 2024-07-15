import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_form_maps_farmer/mobile/mobile_create_maps.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_form_maps_farmer/website/web_create_maps.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

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
    // LatLng(-7.636249, 112.215799),
    // LatLng(-7.636280, 112.215870),
    // LatLng(-7.637097, 112.215655),
    // LatLng(-7.637065, 112.215575),
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

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: MobileCreateMaps(
          user: widget.user,
          ref: ref,
          latController: latController,
          longController: longController,
          addListpoint: _addListpoint,
          pointMaps: pointMaps),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Tambah Lokasi lahan",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              "Pengajuan Pupuk",
              style: largeReguler,
            ),
          ),
          child: SafeArea(
            child: MobileCreateMaps(
                user: widget.user,
                ref: ref,
                latController: latController,
                longController: longController,
                addListpoint: _addListpoint,
                pointMaps: pointMaps),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.6,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: width * 0.06,
          leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                // ref.read(routerProvider).pop();
                Navigator.of(context).pop();
                // context.pop();
              },
              icon: const Icon(Icons.cancel)),
        ),
        body: WebCreateMaps(
            user: widget.user,
            ref: ref,
            latController: latController,
            longController: longController,
            addListpoint: _addListpoint,
            pointMaps: pointMaps),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
