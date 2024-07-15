import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/domain/entities/user_farmer.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_member_farmer_group/method/information_menber.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_detail_member_farmer_group/mobile/mobile_detail_member.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/appbar_custom_widget.dart';
import 'package:mol_petani/presentation/widgets/button_submission_widget.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class GroupDetailMemberFarmerGroupPage extends ConsumerWidget {
  const GroupDetailMemberFarmerGroupPage(this.user, {super.key});

  final UserFarmer user;

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            width,
            height * 0.3 -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: AppbarCustomWidget(
            height: height,
            width: width,
            title: "Detail Anggota",
            content: user.name,
            subContext: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  user.noHp,
                  style: regulerReguler.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: MobileDetailMember(user: user, ref: ref));
  }

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      title: "Detail Member",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {
              ref.read(routerProvider).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          middle: Text(
            "Detail Member Kelompok Tani",
            style: largeReguler,
          ),
          trailing: IconButton(
            onPressed: () {
              context.buildShowDialog(
                judul: "Konfirmasi Hapus",
                berhasil: "Hapus",
                keterangan: "Apakah Anda yakin ingin Menghapus Member?",
                onTapCancel: () {},
                onTapSucces: () {
                  ref
                      .read(dataUserProvider.notifier)
                      .deleteMemberFarmerGroup(idDocument: user.idDocument!);
                },
              );
            },
            icon: Icon(Icons.delete),
          ),
        ),
        child: SafeArea(
          child: MobileDetailMember(user: user, ref: ref),
        ),
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
