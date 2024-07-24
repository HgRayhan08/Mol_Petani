import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_distribution_fertilizer_farmer/group_distribution_fertilizer_farmer_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_main_page/Website/web_main_group.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_submisson_fertilizer_group/group_submission_fertilizer_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/group_home_page/home_farmer_group_page.dart';
import 'package:mol_petani/presentation/page/farmer_group/profile_group/profile_group_page.dart';
import 'package:mol_petani/presentation/page/profile/profile_page.dart';
import 'package:mol_petani/presentation/provider/router/router_provider.dart';
import 'package:mol_petani/presentation/provider/user_data/data_user_provider.dart';
import 'package:mol_petani/presentation/widgets/platform_widget.dart';

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
    HomeFarmerGroupPage(),
    GroupSubmissionFertilizerGroup(),
    GroupDistributionFertilizerFarmerPage(),
    ProfileGroupPage(),
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
    return const WebmainGroup();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      dataUserProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed("user-login");
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
            ),
          );
        }
      },
    );
    return PlatformWidget(
        androidBuilder: buildAndroid,
        iosBuilder: buildIos,
        webBuilder: buildWeb);
  }
}
