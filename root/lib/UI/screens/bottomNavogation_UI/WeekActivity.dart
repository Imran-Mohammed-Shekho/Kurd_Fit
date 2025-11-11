import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeekActivity extends StatelessWidget {
  const WeekActivity({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Nutback.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(child: _buildText("Weekly Progress", 24, true)),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      "Oct 23 -Oct 29 , 2025",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildcontainer(
                        "4",
                        Icon(
                          Icons.fitness_center,
                          color: const Color(0xFFFFFFFF),
                        ),
                        "Workout",
                      ),
                      _buildcontainer(
                        "609",
                        Icon(
                          Icons.local_fire_department,
                          color: const Color(0xFFFFFFFF),
                        ),
                        "Calorie",
                      ),
                      _buildcontainer(
                        "4h 23M",
                        Icon(
                          Icons.timer_rounded,
                          color: const Color(0xFFFFFFFF),
                        ),
                        "Duration",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildText("Daily BreakDown", 20, true),
                SizedBox(height: 10),
                Column(
                  children: [
                    _buildListTiles(),
                    _buildListTiles(),
                    _buildListTiles(),
                    _buildListTiles(),
                    _buildListTiles(),
                    _buildListTiles(),
                    _buildListTiles(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildListTiles() {
  return Padding(
    padding: EdgeInsets.all(10),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildListTileData("200", "Calorie"),
                _buildListTileData("45", "min"),
                _buildListTileData("2,400", "Steps"),
              ],
            ),

            leading: SizedBox(
              height: 40,
              width: 40,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText("Thu", 12, false),
                    _buildText("29", 12, false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildListTileData(String number, String text) {
  return Column(
    children: [
      Text(number, style: TextStyle(color: const Color(0xFFFFFFFF))),
      SizedBox(height: 10),
      Text(text, style: TextStyle(color: const Color(0xFFFFFFFF))),
    ],
  );
}

Widget _buildcontainer(String text, dynamic icon, String type) {
  return SizedBox(
    height: 150,
    width: 110,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildIcon(icon),
              SizedBox(height: 10),
              _buildText(text, 18, true),
              SizedBox(height: 10),
              _buildText(type, 16, false),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildIcon(dynamic Icon) {
  if (Icon is String && Icon.toLowerCase().endsWith(".png")) {
    return Image.asset(Icon);
  } else if (Icon is String && Icon.toLowerCase().endsWith(".svg")) {
    return SvgPicture.asset(Icon);
  } else {
    return Icon;
  }
}

Widget _buildText(String text, double fontSize, bool isBold) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
