import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/UI/screens/SignUp_screen.dart';
import 'package:page_transition/page_transition.dart';

class Introduction1 extends StatefulWidget {
  const Introduction1({super.key});

  @override
  State<Introduction1> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "lib/assets/images/introduction2.png",
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "lib/assets/images/imageR_I.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          Positioned(
            bottom: 150,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "        Your Fitness\n Journey Starts Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  """ Get personalized workout plans, track your 
         progress, and join our community.""",
                  style: TextStyle(
                    color: const Color(0xffB5B5B5).withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            child: IntorductionButtons(
              () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 600),
                    reverseDuration: Duration(milliseconds: 500),
                    child: LoginScreen(),
                  ),
                );
              },
              "Login",
              const Color(0xff5B58FB),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 30,
            child: IntorductionButtons(
              () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 600),
                    reverseDuration: Duration(milliseconds: 500),
                    child: SignupScreen(),
                  ),
                );
              },
              "Sign Up ",
              Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class IntorductionButtons extends StatelessWidget {
  final VoidCallback? ontap;
  final String text;
  final Color color;
  const IntorductionButtons(this.ontap, this.text, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: GlowContainer(
        blurRadius: 10,
        borderRadius: BorderRadius.circular(20),
        spreadRadius: 0.5,
        shape: BoxShape.rectangle,
        glowColor: Colors.white,
        child: Container(
          width: 350,
          height: 50,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(255, 139, 139, 139),
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
