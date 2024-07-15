import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/page/farmer/profile_farmer/method/information_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/profile_group/method/information_group.dart';
import 'package:mol_petani/presentation/page/farmer_group/profile_group/method/menu_group.dart';
import 'package:mol_petani/presentation/page/profile/method/stack_image_profile.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MobileFarmerProfile extends StatelessWidget {
  final WidgetRef ref;
  const MobileFarmerProfile({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.05),
        informationFarmer(ref),
        menuGroup(
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
