import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/method/sub_menu_grup_farmer.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/method/sub_menu_ppl.dart';
import 'package:mol_petani/presentation/widgets/news_widget.dart';

class MobileHomeGroup extends ConsumerWidget {
  final bool? shrinkWrap;
  final bool? physic;
  const MobileHomeGroup({
    super.key,
    this.shrinkWrap = false,
    this.physic = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: shrinkWrap!,
      // physics: const NeverScrollableScrollPhysics(),
      physics: physic == true
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        subMenuGrupFarmer(context, ref),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          // margin: EdgeInsets.only(top: height * 0.01),
          height: height * 0.7,
          child: const NewsWidget(
            amounnt: 3,
            routes: "main-kelompok",
          ),
        ),
      ],
    );
  }
}
