import 'package:flutter/material.dart';
import 'package:gym/UI/screens/landingScreen_UI/activityLevelScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/questionScreenControll.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/core/Utils/localized_text.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          SizedBox(
            height: size.height / 2,
            child: Image.asset(
              "assets/images/bggg.png",
              fit: BoxFit.cover,
              width: size.width,
            ),
          ),

          Text(
            textAlign: TextAlign.center,
            tr(context, " Your fitness \njourney starts \nhere"),
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            textAlign: TextAlign.center,
            tr(
              context,
              """ Achieve your fitness goals with\npersonalized workouts and expert\nguidance.""",
            ),
            style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
          ),
          SizedBox(height: 30),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: buildButtom(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Questionscreencontroll(),
                  ),
                );
              },
              text: "Contine",
              isTrue: true,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Text(
                tr(context, "Already Have account ? Login"),
                style: TextStyle(
                  color: kwhite,
                  decoration: TextDecoration.underline,
                  decorationColor: kwhite,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
