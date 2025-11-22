import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/questionScreenControll.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/images/introduction.png",
              fit: BoxFit.cover,
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Image.asset(
          //     "assets/images/11.png",
          //     fit: BoxFit.cover,
          //     width: double.infinity,
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  " Your fitness \njourney starts \nhere",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  """ Achieve your fitness goals with\npersonalized workouts and expert\nguidance.""",
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
                ),
                SizedBox(height: 30),

                buildButtom(ontap: () {}),

                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
