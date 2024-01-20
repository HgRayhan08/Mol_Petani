import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/home_page/method/information_user.dart';
import 'package:mol_petani/presentation/page/home_page/method/sub_menu_ppl_page.dart';

class PplHomePage extends ConsumerWidget {
  const PplHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff60EFB8),
        title: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            "assets/logo2.png",
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: ListView(
        children: [
          informationUser(context, ref),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          subMenuPplPage(context, ref),
        ],
      ),
    );
  }
}
