import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_home_page/home_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_accepted_fertilizer/farmer_accepted_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_main_page/web/web_main_farmer.dart';
import 'package:mol_petani/presentation/page/farmer/farmer_report/farmer_report_page.dart';
import 'package:mol_petani/presentation/page/farmer/profile_farmer/profile_farmer_page.dart';
import 'package:mol_petani/presentation/page/profile/farmer_profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class MainFarmerPage extends ConsumerStatefulWidget {
  const MainFarmerPage({super.key});

  @override
  ConsumerState<MainFarmerPage> createState() => _MainFarmerPageState();
}

class _MainFarmerPageState extends ConsumerState<MainFarmerPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeFarmerPage(),
    FarmerAcceptedFertilizerpage(),
    FarmerReportPage(),
    ProfileFarmerPage()
  ];

  List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: 'Penerimaan',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.comment),
      label: 'Pengaduan',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "profile",
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildAndroid(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
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

  Widget buildIos(BuildContext context, WidgetRef ref) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: items,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildWeb(BuildContext context, WidgetRef ref) {
    return const WebMainFarmer();
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

    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
