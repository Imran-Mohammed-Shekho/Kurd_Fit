import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Issuesscreen extends StatefulWidget {
  const Issuesscreen({super.key});

  @override
  State<Issuesscreen> createState() => _IssuesscreenState();
}

class _IssuesscreenState extends State<Issuesscreen> {
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

            buildQuestionText(text: "Any health issues?"),
            buildListViewOptions(
              options: [
                {"title": "Back Pain", "icon": Icons.accessibility_new},
                {"title": "Knee Pain", "icon": Icons.directions_walk},
                {"title": "Shoulder Pain", "icon": Icons.accessibility},
                {"title": "Breathing Difficulty", "icon": Icons.wind_power},
                {"title": "Low Energy / Fatigue", "icon": Icons.battery_1_bar},
                {"title": "No Issues", "icon": Icons.check_circle},
              ],
            ),
            buildButtom(
              ontap: () {
                Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                ).changeCurrentIndex();
              },
              text: "Contine",
              isTrue: true,
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
