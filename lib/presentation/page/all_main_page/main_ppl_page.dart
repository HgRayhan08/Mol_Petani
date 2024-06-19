import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/all_home_page/home_ppl_page.dart';
import 'package:mol_petani/presentation/page/ppl_complaint_report/ppl_complaint_report_page.dart';
import 'package:mol_petani/presentation/page/ppl_pest_report/ppl_pest_reporting_page.dart';
import 'package:mol_petani/presentation/page/profile/distributor_profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';

class MainPplPage extends ConsumerStatefulWidget {
  const MainPplPage({super.key});

  @override
  ConsumerState<MainPplPage> createState() => _MainPplPageState();
}

class _MainPplPageState extends ConsumerState<MainPplPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePplPage(),
    PplComplaintReportPage(),
    PplPestReportingPage(),
    DistributorProfilePage()
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
        ref.read(routerProvider).goNamed("user-login");
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_comment_outlined),
            label: 'Hama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
