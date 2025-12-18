import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/Dashboard_Screen.dart';
import 'package:gym/UI/screens/appTheme/custom_colors.dart';

import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
import 'package:gym/UI/screens/landingScreen_UI/weightScreen.dart';
import 'package:gym/UI/screens/shop_UI/app_shop.dart';
import 'package:gym/UI/screens/workout_UI/workouts_screen.dart';
import 'package:gym/state/providers/appState_Provider.dart';
import 'package:provider/provider.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  final GlobalKey _key = GlobalKey();
  List<Widget> pages = [
    DashboardScreen(),
    WorkoutsScreen(),
    AppShop(),
    ProfileScreen(),
  ];
  bool _offlineshown = false;
  bool _onlineshown = false;

  List<String> lables = ["Dashboard", "Workouts", "Gym Shop", "Profile"];
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      final connected = await hasinternet();
      if (!mounted) return;
      if (!connected && !_offlineshown) {
        _offlineshown = true;
        _onlineshown = false;
        _matrialBannerOffline();
      }
      if (connected && _offlineshown && !_onlineshown && mounted) {
        _onlineshown = true;
        _offlineshown = false;
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

        _matrialBannerOnline();
      }
    });
  }

  Future<bool> hasinternet() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _matrialBannerOffline() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: kred,
        content: Row(
          children: [
            Icon(Icons.wifi_off, color: kwhite),
            Text("No intenet connection", style: TextStyle(color: kwhite)),
          ],
        ),
      ),
    );
  }

  void _matrialBannerOnline() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Icon(Icons.check_circle, color: kwhite),
            Text("Connection Back", style: TextStyle(color: kwhite)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppstateProvider>(context);
    final color = Theme.of(context).extension<CustomColors>();
    // TextStyle textstyleforBNT() {
    //   return TextStyle(
    //     fontSize: 12,
    //     fontWeight: FontWeight.w900,
    //     color: color?.TextFrombottomNavigationbar ?? Colors.red,
    //   );
    // }

    return Scaffold(
      body: pages[appState.currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: kwhite.withValues(alpha: 0.5),
        backgroundColor: color?.bottomNavigationBarBg ?? Colors.deepPurple,
        index: appState.currentindex,
        height: 65,
        key: _key,

        animationDuration: Duration(milliseconds: 600),
        items: [
          Icon(Icons.space_dashboard_rounded, size: 40, color: Colors.black),

          Image.asset("assets/icons/workout.png", height: 35),

          Image.asset("assets/icons/shopping-cart.png", height: 40),
          Icon(Icons.person, size: 40, color: Colors.black),
        ],
        onTap: (index) {
          appState.updatePageState(index);
        },
        animationCurve: Curves.easeInOut,
      ),
    );
  }
}
