import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_register_account_farmer/mobile/mobile_register.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupRegisterAccountFarmerPage extends ConsumerWidget {
  final UserFarmer user;
  const GroupRegisterAccountFarmerPage(this.user, {super.key});

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ref
                  .read(routerProvider)
                  .goNamed("detail-member-group", extra: user);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            "Register Account",
            style: regulerReguler,
          ),
        ),
        body: MobileRegister(ref, user: user));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Register Account",
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: IconButton(
              onPressed: () {
                ref
                    .read(routerProvider)
                    .goNamed("detail-member-group", extra: user);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            middle: Text(
              "Register Account",
              style: regulerReguler,
            ),
          ),
          child: SafeArea(
            child: MobileRegister(ref, user: user),
          )),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Register Account",
            style: regulerReguler,
          ),
        ),
        body: MobileRegister(ref, user: user));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
