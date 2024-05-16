import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/farmer_login/mobile/mobile_login_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_login/website/website_login_farmer.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class LoginPetaniPage extends ConsumerWidget {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  LoginPetaniPage({super.key});

  Widget _buildAndroid(BuildContext context) {
    return MobileLoginFarmer(
        emailControler: emailControler, passwordControler: passwordControler);
  }

  Widget _buildAios(BuildContext context) {
    return CupertinoPageScaffold(
      child: MobileLoginFarmer(
          emailControler: emailControler, passwordControler: passwordControler),
    );
  }

  Widget _buildWebsite(BuildContext context) {
    return WebsiteLoginFarmer(
        emailControler: emailControler, passwordControler: passwordControler);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed("main-farmer");
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error poll"),
            ),
          );
        }
      },
    );

    // final mediaWidth = MediaQuery.of(context).size.width;
    // final mediaHeight = MediaQuery.of(context).size.height;

    return PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildAios,
        webBuilder: _buildWebsite);
  }
}
