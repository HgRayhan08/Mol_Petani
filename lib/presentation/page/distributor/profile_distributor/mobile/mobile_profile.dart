import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/page/profile/method/information_distributor.dart';
import 'package:mol_petani/presentation/page/profile/method/menu_distributor.dart';
import 'package:mol_petani/presentation/page/profile/method/stack_image_profile.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MobileProfile extends StatelessWidget {
  final WidgetRef ref;
  const MobileProfile({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        stackImageProfile(ref, width, height),
        informationDistributor(ref),
        menuDistributor(
          ref,
          width,
          height,
          onTapLogout: () {
            context.buildShowDialog(
              judul: "Konfirmasi Logout",
              berhasil: "Keluar",
              keterangan: "Apakah Anda yakin ingin keluar?",
              onTapCancel: () {},
              onTapSucces: () {
                ref.read(dataUserProvider.notifier).logoutPetugas();
              },
            );
          },
        ),
      ],
    );
  }
}
