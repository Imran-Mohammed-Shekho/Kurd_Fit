import 'package:flutter/material.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';

class Introduction1 extends StatefulWidget {
  const Introduction1({super.key});

  @override
  State<Introduction1> createState() => _IntroductionState();
}

//GENDER,/gOAL/FOUCS BODY./FIT,LEVLE/ACTIVE-LEVEL/TALL/AGE/WEIGHT/NAME/ANY ISSUES/WORKOUT-DAY/SET WORKOUTDAYS/
class _IntroductionState extends State<Introduction1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/images/introduction2.png",
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/11.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Your Fitness\n Journey Starts Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  """ Get personalized workout plans, track your\nprogress, and join our community.""",
                  style: TextStyle(
                    color: const Color(0xffB5B5B5).withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30),

                IntorductionButtons(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  "Login",
                  const Color(0xff5B58FB),
                ),
                SizedBox(height: 20),
                IntorductionButtons(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  "Sign Up ",
                  Colors.white.withValues(alpha: 0.1),
                ),
                SizedBox(height: 30),
              ],
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
      child: SizedBox(
        height: 50,
        width: 350,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xffffffff).withValues(alpha: 0.5),
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
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
                child: Icon(
                  (text == "Login" || text == "Sign Up")
                      ? null
                      : Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
