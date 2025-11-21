import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenederListViewOptions.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/ProgressTracker.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/genederQuestionsTitle.dart';

const kwhite = Colors.white;

class selectGender extends StatefulWidget {
  const selectGender({super.key});

  @override
  State<selectGender> createState() => _selectGenderState();
}

class _selectGenderState extends State<selectGender> {
  double width = 300;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            buildProgressTracker(size: size),

            buildQuestionText(),
            buildListViewOptions(),
            buildButtom(),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
