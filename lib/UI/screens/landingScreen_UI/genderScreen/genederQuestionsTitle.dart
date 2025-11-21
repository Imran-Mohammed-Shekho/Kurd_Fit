import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class buildQuestionText extends StatelessWidget {
  const buildQuestionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "What is your gender?",
          style: TextStyle(
            color: kwhite,
            fontSize: 28,
            fontWeight: FontWeight.normal,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
