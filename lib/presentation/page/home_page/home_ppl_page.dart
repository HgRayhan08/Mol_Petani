import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/home_page/method/information_user.dart';
import 'package:mol_petani/presentation/page/home_page/method/sub_menu_ppl_page.dart';

class HomePplPage extends ConsumerWidget {
  const HomePplPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: informationUser(context, ref),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          subMenuPplPage(context, ref),
        ],
      ),
    );
  }
}
