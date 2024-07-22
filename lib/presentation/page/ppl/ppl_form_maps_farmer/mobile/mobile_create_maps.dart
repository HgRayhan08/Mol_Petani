import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_form_maps_farmer/method/logic_create.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/text_field_custom.dart';

class MobileCreateMaps extends StatefulWidget {
  final UserFarmer user;
  final WidgetRef ref;
  final TextEditingController latController;
  final TextEditingController longController;
  final Function() addListpoint;
  final List<LatLng> pointMaps;
  const MobileCreateMaps({
    super.key,
    required this.user,
    required this.ref,
    required this.latController,
    required this.longController,
    required this.addListpoint,
    required this.pointMaps,
  });

  @override
  State<MobileCreateMaps> createState() => _MobileCreateMapsState();
}

class _MobileCreateMapsState extends State<MobileCreateMaps> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      children: [
        TextFieldCustom(
          hinttext: "Latitude",
          title: "Latitude",
          controller: widget.latController,
        ),
        SizedBox(height: height * 0.02),
        TextFieldCustom(
          controller: widget.longController,
          title: "Latitude",
          hinttext: 'Latitude',
        ),
        SizedBox(height: height * 0.02),
        ButtonSubmissionWidget(
          onTap: widget.addListpoint,
          title: "Add",
        ),
        SizedBox(height: height * 0.02),
        SizedBox(
          height: height * 0.4,
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
        ButtonSubmissionWidget(
          onTap: _isLoading ? null : _create,
          title: "Simpan",
        ),
      ],
    );
  }

  void _create() async {
    final registerLocation = CreateCordinat(
        ref: widget.ref,
        context: context,
        cordinat: widget.pointMaps,
        user: widget.user);
    registerLocation.create((isLoading) {
      setState(() {
        _isLoading = isLoading;
      });
    });
  }
}
