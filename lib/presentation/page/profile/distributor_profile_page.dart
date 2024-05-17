import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/profile/method/information_distributor.dart';
import 'package:mol_petani/presentation/page/profile/method/menu_distributor.dart';
import 'package:mol_petani/presentation/page/profile/method/stack_image_profile.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class DistributorProfilePage extends ConsumerStatefulWidget {
  const DistributorProfilePage({
    super.key,
  });

  @override
  ConsumerState<DistributorProfilePage> createState() =>
      _DistributorProfilePageState();
}

class _DistributorProfilePageState
    extends ConsumerState<DistributorProfilePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed("login-petani");
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
            ),
          );
        }
      },
    );
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueLight,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "User Profile",
          style: largeReguler.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          stackImageProfile(ref, width, height),
          informationDistributor(ref),
          menuDistributor(
            ref,
            width,
            height,
            onTapLogout: () {
              context.buildShowDialog(
                onTapCancel: () {
                  context.pop();
                },
                onTapSucces: () {
                  ref.read(dataUserProvider.notifier).logoutPetugas();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
