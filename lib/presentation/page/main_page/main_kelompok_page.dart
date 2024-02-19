import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/data_submission_grup_farmer_page/data_submission_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/home_page/home_grup_farmer_page.dart';
import 'package:mol_petani/presentation/page/profile/ppl_profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MainKelompokPage extends ConsumerStatefulWidget {
  const MainKelompokPage({super.key});

  @override
  ConsumerState<MainKelompokPage> createState() => _MainKelompokPageState();
}

class _MainKelompokPageState extends ConsumerState<MainKelompokPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeGrupFarmerPage(),
    DataSubmissionGrupFarmerPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
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
              image: AssetImage("assets/distribution.png"),
              width: 25,
              height: 25,
            ),
            label: 'Distribution',
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
