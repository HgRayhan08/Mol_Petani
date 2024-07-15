import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mol_petani/presentation/misc/constant.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_home/home_distributor_page.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_main_page/website/web_distributor_main.dart';
import 'package:mol_petani/presentation/page/distributor/distributor_sends_fertilizer/distributor_sends_fertilizer_page.dart';
import 'package:mol_petani/presentation/page/distributor/profile_distributor/profile_distributor_page.dart';
import 'package:mol_petani/presentation/page/profile/distributor_profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

class MainDistributorPage extends ConsumerStatefulWidget {
  const MainDistributorPage({super.key});

  @override
  ConsumerState<MainDistributorPage> createState() =>
      _MainDistributorPageState();
}

class _MainDistributorPageState extends ConsumerState<MainDistributorPage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeDistributorPage(),
    DistributorSendsFertilizerPage(),
    ProfileDistributorPage()
  ];

  List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
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
      label: 'Pengirimman',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: background,
          elevation: 100,
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
    return const WebDistributorPage();
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