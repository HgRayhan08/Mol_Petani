import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/page/all_home_page/home_distributor_page.dart';
import 'package:mol_petani/presentation/page/distributor_sends_fertilizer/distributor_sends_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/distributor_submission_kuota/distributor_submission_kuoata_page.dart';
import 'package:mol_petani/presentation/page/profile/ppl_profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MainDistributorPage extends ConsumerStatefulWidget {
  const MainDistributorPage({super.key});

  @override
  ConsumerState<MainDistributorPage> createState() =>
      _MainDistributorPageState();
}

class _MainDistributorPageState extends ConsumerState<MainDistributorPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeDistributorPage(),
    DistributorSubmissionKuotaPage(),
    DistributorSendsFertilizerPage(),
    PplProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dataUserProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed("login-petani");
      } else if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/data_pengajuan_kelompok.png"),
              width: 25,
              height: 25,
            ),
            label: 'Pengajuan',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/data_pengajuan_kelompok.png"),
              width: 25,
              height: 25,
            ),
            label: 'Pengirimman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "profile",
          )
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
