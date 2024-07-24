import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribusi_kuota_fertilizer_farmer/mobile/mobile_distribution_kuota_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribusi_kuota_fertilizer_farmer/website/web_distribusi_kuota_fertilizer_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDistributionKuotaFertilizerFarmerpage extends ConsumerWidget {
  final UserFarmer user;
  const GroupDistributionKuotaFertilizerFarmerpage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Distribusi Pupuk", style: largeReguler),
      ),
      body: MobileDistributionKuotaFerilizerFarmer(ref: ref, user: user),
      floatingActionButton: IconButton(
        onPressed: () {
          ref
              .read(routerProvider)
              .pushNamed("form_distribution-farmer", extra: user);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Distribusi Pupuk",
      home: CupertinoPageScaffold(
        backgroundColor: background,
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Distributution Pupuk",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              ref
                  .read(routerProvider)
                  .pushNamed("form_distribution-farmer", extra: user);
            },
            icon: const Icon(Icons.add),
          ),
        ),
        child: SafeArea(
          child: MobileDistributionKuotaFerilizerFarmer(ref: ref, user: user),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: width * 0.06,
        leading: ElevatedButton(
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
          child: Text(
            "Back",
            style: regulerReguler,
          ),
        ),
      ),
      body: WebDistributionKuotaFertilizerFarmer(ref: ref, user: user),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
