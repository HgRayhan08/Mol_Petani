import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mol_petani/presentation/misc/build_context_alert_dialog.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/maps/maps_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_complaint_report/ppl_complaint_report_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_data_farmer/ppl_data_farmer_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_distributor_data/ppl_distributor_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_farmer_grup_data/ppl_farmer_grup_data_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_home_page/home_ppl_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_monitoring/ppl_monitoring_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_pest_report/ppl_pest_reporting_page.dart';
import 'package:mol_petani/presentation/page/ppl/ppl_submission_data_fertilizer_farmer_group/ppl_submission_data_fertilizer_farmer_group_page.dart';

import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:sidebarx/sidebarx.dart';

class WebPplMain extends ConsumerStatefulWidget {
  const WebPplMain({super.key});

  @override
  ConsumerState<WebPplMain> createState() => _WebPplMainState();
}

class _WebPplMainState extends ConsumerState<WebPplMain> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePplPage(),
    PplDistributorDataPage(),
    PplFarmerGrupDataPage(),
    PplSubmissionDataFertilizerFarmerGroupPage(),
    PplDataFarmer(),
    MapsPage(),
    PplMonitoringPage(),
    PplComplaintReportPage(),
    PplPestReportingPage()
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
            // headerBuilder: (context, extended) {
            //   return
            // },
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
                label: 'Data Distributor',
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
                label: "Data Kelompok Tani",
                onTap: () {
                  _onItemTapped(2);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_pengajuan_kelompok.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Pengajuan pupuk Kelompok tani",
                onTap: () {
                  _onItemTapped(3);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/data_pengajuan_dis.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Data Petani",
                onTap: () {
                  _onItemTapped(4);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/maps.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Lokasi Sawah petani",
                onTap: () {
                  _onItemTapped(5);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/monitor_pupuk.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Monitoring Pupuk Kelompok",
                onTap: () {
                  _onItemTapped(6);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/monitor_pupuk.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Laporan Petani",
                onTap: () {
                  _onItemTapped(7);
                },
              ),
              SidebarXItem(
                iconBuilder: (context, selected) {
                  return Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/monitor_pupuk.png"),
                        color: selected ? Colors.white : Colors.white,
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  );
                },
                label: "Laporan Hama",
                onTap: () {
                  _onItemTapped(8);
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
