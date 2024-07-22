// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';

import 'package:mol_petani/presentation/misc/build_context_alert_information.dart';
import 'package:mol_petani/presentation/provider/maps/maps_provider.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';

class CreateCordinat {
  final WidgetRef ref;
  final BuildContext context;
  final List<LatLng> cordinat;
  final UserFarmer user;
  CreateCordinat(
      {required this.ref,
      required this.context,
      required this.cordinat,
      required this.user});

  Future<void> create(Function setLoading) async {
    if (cordinat == [] || user == []) {
      context.buildAlertInformation(
          title: "Pesan", subTitle: "Please enter the data completely");
    } else {
      setLoading(true);

      try {
        var result = await ref
            .read(mapsProviderProvider.notifier)
            .createLocationFarmer(
                cordinat: cordinat,
                farmerName: user.name,
                idUserFarmer: user.idUserFarmer);

        if (result.isSuccess) {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Berhasil Menambahkan Data");
          Future.delayed(
            const Duration(seconds: 5),
            () {
              ref
                  .read(routerProvider)
                  .goNamed("ppl-detail-farmer", extra: user);
            },
          );
        } else {
          context.buildAlertInformation(
              title: "Pesan", subTitle: "Gagal Menambahkan Data");
        }
      } catch (e) {
        context.buildAlertInformation(
            title: "Pesan", subTitle: "Terjadi kesalahan: $e");
      } finally {
        setLoading(false);
      }
    }
  }
}
