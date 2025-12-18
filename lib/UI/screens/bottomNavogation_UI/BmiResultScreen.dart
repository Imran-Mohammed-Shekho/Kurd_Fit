import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/profile_screen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';

class BmiResultScreen extends StatelessWidget {
  final String bmiResult;

  final String resultText;

  final String interpretation;

  const BmiResultScreen(
    this.bmiResult,
    this.resultText,
    this.interpretation, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        title: const Text(
          "BMI Calculator  ",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.surface,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "YOUR RESULT  ",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            flex: 5,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: kwhite.withValues(alpha: 0.2)),
                    color: kwhite.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(20, 500),
                      topRight: Radius.elliptical(300, 100),
                    ),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                          color: (resultText == "Normal"
                              ? const Color.fromARGB(255, 4, 236, 12)
                              : resultText == "Overweight"
                              ? const Color.fromARGB(255, 255, 41, 26)
                              : const Color.fromARGB(255, 255, 41, 26)),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: kwhite,
                        ),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: kwhite,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      buildButtom(
                        ontap: () {
                          Navigator.pop(context);
                        },
                        text: "Re-Calculate",
                        isTrue: false,
                        color: kred,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
