import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/activityLevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/questionScreenControll.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff6157C9),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/images/introduction.png",
              fit: BoxFit.cover,
              width: size.width,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff6157C9),
                    Color(0xff6157C9),
                    kwhite.withValues(alpha: 0.3),
                    kwhite.withValues(alpha: 0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
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

                buildButtom(
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Questionscreencontroll(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
                  child: Text(
                    "Already Have account ? Login",
                    style: TextStyle(
                      color: kwhite,
                      decoration: TextDecoration.underline,
                      decorationColor: kwhite,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
