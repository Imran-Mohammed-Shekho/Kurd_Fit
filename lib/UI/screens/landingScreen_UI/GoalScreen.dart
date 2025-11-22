import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Goalscreen extends StatefulWidget {
  const Goalscreen({super.key});

  @override
  State<Goalscreen> createState() => _GoalscreenState();
}

class _GoalscreenState extends State<Goalscreen> {
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

            buildQuestionText(text: "What is your Goal?"),
            buildListViewOptions(
              options: [
                {"title": "Fat Loss", "icon": Icons.local_fire_department},
                {"title": "Gain Muscle", "icon": Icons.fitness_center},
                {"title": "Gain Strength", "icon": Icons.sports_gymnastics},
                {"title": "Other", "icon": Icons.auto_awesome},
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
