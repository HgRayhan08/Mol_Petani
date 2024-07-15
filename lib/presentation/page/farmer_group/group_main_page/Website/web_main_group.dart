import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_home/home_distributor_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_accepted_kuota_fertilizer/group_accepted_kuota_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_data_farmer/group_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/group_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_member_farmer_group/group_member_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_report_hama/group_report_hama_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/group_submission_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:sidebarx/sidebarx.dart';

class WebmainGroup extends ConsumerStatefulWidget {
  const WebmainGroup({super.key});

  @override
  ConsumerState<WebmainGroup> createState() => _WebmainGroupState();
}

class _WebmainGroupState extends ConsumerState<WebmainGroup> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeDistributorPage(),
    GroupDataFarmerpage(),
    GroupMemberFarmerGroupPage(),
    GroupAcceptedKuotaFertilizerPage(),
    GroupReportHamaPage(),
    GroupSubmissionFertilizerGroup(),
    GroupDistributionFertilizerFarmerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller =
        SidebarXController(selectedIndex: _selectedIndex, extended: true);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: width * 0.03),
          child: Image.asset(
            "assets/logo2.png",
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        leadingWidth: width * 0.1,
        backgroundColor: blueLight,
        actions: [
          ElevatedButton(
            onPressed: () {
              context.buildShowDialog(
                berhasil: "Keluar",
                judul: "Konfirmasi Logout",
                keterangan: "Apakah Anda yakin ingin keluar?",
                onTapCancel: () {
                  context.pop();
                },
                onTapSucces: () {
                  ref.read(dataUserProvider.notifier).logoutPetugas();
                },
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.01),
              backgroundColor: blueInfo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.logout, color: Colors.white),
                Text(
                  "Logout",
                  style: smallReguler.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.03,
          )
        ],
      ),
      body: Row(
        children: [
          SidebarX(
            controller: controller,
            theme: const SidebarXTheme(
              decoration: BoxDecoration(color: Colors.blue),
              textStyle: TextStyle(color: Colors.white),
              selectedTextStyle: TextStyle(color: Colors.white),
              iconTheme: IconThemeData(color: Colors.white),
              selectedIconTheme: IconThemeData(color: Colors.white),
            ),
            extendedTheme: SidebarXTheme(
              width: width * 0.2,
              decoration: const BoxDecoration(color: blueLight),
            ),
            items: [
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: 'Home',
                onTap: () {
                  _onItemTapped(0);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/registrasi_distributor.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: 'Data Petani',
                onTap: () {
                  _onItemTapped(1);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_petani.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Data Member",
                onTap: () {
                  _onItemTapped(2);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_petani.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Peneriman Pupuk",
                onTap: () {
                  _onItemTapped(3);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_petani.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Laporan Hama",
                onTap: () {
                  _onItemTapped(4);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_petani.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Penngajuan Pupuk",
                onTap: () {
                  _onItemTapped(5);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_petani.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Distribusi Pupuk",
                onTap: () {
                  _onItemTapped(6);
                },
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: _widgetOptions[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
