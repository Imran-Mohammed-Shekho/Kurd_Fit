import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/common.dart';

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/Nutback.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: const Text(
                    "BMI Calculator  ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 90),
                child: const Text(
                  "YOUR RESULT  ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(
                          255,
                          255,
                          255,
                          1,
                        ).withOpacity(0.2),
                      ),
                      color: const Color.fromRGBO(
                        255,
                        255,
                        255,
                        1,
                      ).withOpacity(0.06),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.elliptical(300, 100),
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          resultText.toUpperCase(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 4, 236, 12),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bmiResult,
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Color.from(
                              alpha: 1,
                              red: 1,
                              green: 1,
                              blue: 1,
                            ),
                          ),
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.from(
                              alpha: 1,
                              red: 1,
                              green: 1,
                              blue: 1,
                            ),
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        CommonButton(
                          () {
                            Navigator.pop(context);
                          },
                          "Re_Calculate ",
                          const Color.fromRGBO(255, 255, 255, 1),
                          false,
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
