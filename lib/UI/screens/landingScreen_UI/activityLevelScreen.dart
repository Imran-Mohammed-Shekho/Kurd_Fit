import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Activitylevelscreen extends StatefulWidget {
  const Activitylevelscreen({super.key});

  @override
  State<Activitylevelscreen> createState() => _ActivitylevelscreenState();
}

class _ActivitylevelscreenState extends State<Activitylevelscreen> {
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            buildQuestionText(text: "Choose your Activity level"),
            buildListViewOptions(
              options: [
                {
                  "title": "Sedentary",
                  "icon": Icons.chair_alt,
                }, // little/no exercise
                {
                  "title": "Light Activity",
                  "icon": Icons.directions_walk,
                }, // 1–3 days/week
                {
                  "title": "Moderate Activity",
                  "icon": Icons.directions_run,
                }, // 3–5 days/week
                {
                  "title": "Very Active",
                  "icon": Icons.fitness_center,
                }, // 6–7 days/week
                {"title": "Athlete", "icon": Icons.sports_gymnastics},
              ],
            ),
            buildButtom(
              ontap: () {
                Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                ).changeCurrentIndex();
              },
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
