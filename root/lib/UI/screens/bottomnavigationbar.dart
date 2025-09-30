import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/Dashboard_Screen.dart';
import 'package:gym/UI/screens/app_shop.dart';

import 'package:gym/UI/screens/profile_screen.dart';
import 'package:gym/UI/screens/workouts_screen.dart';

int currentindex = 0;

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  GlobalKey _key = GlobalKey();
  List<Widget> pages = [
    Dashboard_Screen(),
    Workouts_Screen(),
    App_Shop(),
    Profile_Screen(),
  ];
  List<String> lables = ["Dashboard", "Workouts", "Gym Shop", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: Stack(
        children: [
          CurvedNavigationBar(
            backgroundColor: Color(0xff0011FF).withOpacity(0.3),
            index: currentindex,
            height: 70,
            key: _key,

            animationDuration: Duration(milliseconds: 600),
            items: [
              Icon(Icons.space_dashboard_rounded, size: 40),

              Image.asset("lib/assets/icons/workout.png", height: 35),

              Image.asset("lib/assets/icons/shopping-cart.png", height: 40),
              Icon(Icons.person, size: 40),
            ],
            onTap: (value) {
              setState(() {
                currentindex = value;
              });
            },
            animationCurve: Curves.easeInOut,
            maxWidth: double.infinity,
          ),
          Positioned(
            bottom: 5,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    lables[0],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(width: 45),
                Text(
                  lables[1],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 55),
                Text(
                  lables[2],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 45),
                Text(
                  lables[3],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
