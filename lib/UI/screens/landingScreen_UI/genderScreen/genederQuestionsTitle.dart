import 'package:flutter/material.dart';
import 'package:gym/core/Utils/localized_text.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class buildQuestionText extends StatelessWidget {
  final String text;

  const buildQuestionText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        tr(context, text),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kwhite,
          fontSize: 28,
          fontWeight: FontWeight.normal,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
