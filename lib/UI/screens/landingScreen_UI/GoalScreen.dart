import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
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
                {"title": "Gain Muscle", "icon": Icons.fitness_center},
                {"title": "Burn body fat", "icon": Icons.local_fire_department},
                {
                  "title": "Lose fat and gain muscle together",
                  "icon": Icons.autorenew,
                },
                {"title": "General health", "icon": Icons.favorite},
              ],
              onselect: (value) {
                context.read<LandingscreenProvider>().setGoal(value);
              },
              typeKey: "goal",
            ),
            buildButtom(
              ontap: () {
                final pro = Provider.of<LandingscreenProvider>(
                  context,
                  listen: false,
                );

                if (pro.goal.isNotEmpty) {
                  pro.changeCurrentIndex();
                }
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
