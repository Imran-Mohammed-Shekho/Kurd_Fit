import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym/UI/screens/landingScreen_UI/WorkoutsDaysinWeekScreen.dart';

class WeekActivity extends StatelessWidget {
  const WeekActivity({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: _buildText("Weekly Progress", 24, true, false, context),
            ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildcontainer(
                    "4",
                    Icon(Icons.fitness_center, color: Colors.green, size: 40),
                    "Workout",
                    context,
                  ),
                  _buildcontainer(
                    "609",
                    Icon(
                      Icons.local_fire_department,
                      size: 40,
                      color: Colors.amber.shade600,
                    ),
                    "Calorie",
                    context,
                  ),
                  _buildcontainer(
                    "4h 23M",
                    Icon(Icons.timer_rounded, size: 40, color: Colors.red),
                    "Duration",
                    context,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Daily BreakDown",
              style: TextStyle(color: kwhite, fontSize: 20),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                _buildListTiles(true, context),
                _buildListTiles(false, context),
                _buildListTiles(false, context),
                _buildListTiles(false, context),
                _buildListTiles(false, context),
                _buildListTiles(false, context),
                _buildListTiles(false, context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildListTiles(bool isLast, context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
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
              color: isLast ? Colors.green : Colors.green.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildText("Thu", 12, false, true, context),
                _buildText("29", 12, false, true, context),
              ],
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
      Text(number, style: TextStyle(color: kwhite)),
      SizedBox(height: 10),
      Text(text, style: TextStyle(color: kwhite)),
    ],
  );
}

Widget _buildcontainer(String text, dynamic icon, String type, context) {
  return SizedBox(
    height: 150,
    width: 110,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 15,
        //     spreadRadius: 1,
        //     color: Colors.white.withValues(alpha: 0.5),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildIcon(icon),
          SizedBox(height: 10),
          _buildText(text, 20, true, true, context),
          SizedBox(height: 10),
          _buildText(type, 16, false, true, context),
        ],
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

Widget _buildText(
  String text,
  double fontSize,
  bool isBold,
  bool isDark,
  context,
) {
  return Text(
    text,
    style: TextStyle(
      color: kwhite,
      fontSize: fontSize,
      fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
