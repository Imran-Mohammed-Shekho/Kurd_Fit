import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

const kwhite = Colors.white;

class Levelscreen extends StatefulWidget {
  const Levelscreen({super.key});

  @override
  State<Levelscreen> createState() => _LevelscreenState();
}

class _LevelscreenState extends State<Levelscreen> {
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

            buildQuestionText(text: "Choose your fitness level"),
            buildListViewOptions(
              options: [
                {"title": "Beginner", "icon": Icons.self_improvement},
                {"title": "Intermediate", "icon": Icons.fitness_center},
                {"title": "Advanced", "icon": Icons.whatshot},
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
