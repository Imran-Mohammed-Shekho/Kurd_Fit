import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/Dashboard_Screen.dart';
import 'package:gym/UI/screens/appTheme/custom_colors.dart';

import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
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
  List<String> lables = ["Dashboard", "Workouts", "Gym Shop", "Profile"];

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
        backgroundColor: color?.bottomNavigationBarBg ?? Colors.deepPurple,
        index: appState.currentindex,
        height: 60,
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
