import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/all_home_page/method/information_user.dart';
import 'package:mol_petani/presentation/page/all_home_page/method/sub_menu_ppl.dart';

class HomePplPage extends ConsumerWidget {
  const HomePplPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: informationUser(context, ref),
      body: ListView(
        children: [
          // Text(ref.watch(dataUserProvider.notifier).state.value!["name"] ?? ""),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          subMenuPpl(context, ref),
        ],
      ),
    );
  }
}
