import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/WeekActivity.dart';
import 'package:gym/UI/screens/landingScreen_UI/GoalScreen.dart';
import 'week_table.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> days = [
      {"day": "Sat", "value": 100, "today": true},
      {"day": "Sun", "value": 130},
      {"day": "Mon", "value": 140},
      {"day": "Tue", "value": 160, "today": true},
      {"day": "Wed", "value": 60},
      {"day": "Thu", "value": 90},
      {"day": "Fri", "value": 190},
    ];

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kwhite.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kwhite.withValues(alpha: 0.1)),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Activity", style: TextStyle(color: Colors.white)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeekActivity()),
                  );
                },
                hoverColor: Colors.white.withValues(alpha: 0.06),
                child: Text(
                  "View Activity",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: days.map((d) {
              return WeekTable(
                isToday: d["today"] ?? false,
                label: d["day"].toString(),
                height: (d["value"] as int).toDouble(),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
