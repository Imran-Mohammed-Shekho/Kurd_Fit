import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/UI/screens/bottomnavigationbar.dart';
import 'package:gym/UI/screens/introduction_screen1.dart';
import 'package:page_transition/page_transition.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'lib/assets/images/Nutback.png',
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 100,
              left: 25,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "Kurd  Fit",
                      style: GoogleFonts.pacifico(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 30),
                    child: Text(
                      "Training, Gym , Strength",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250,
              left: 155,
              child: Image.asset("lib/assets/images/man.png", width: 100),
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 15, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassyTextField("Email", (value) {
                      setState(() {
                        email = value;
                      });
                    }, 60),
                    SizedBox(height: 15),
                    GlassyTextField("Password", (value) {
                      setState(() {
                        password = value;
                      });
                    }, 60),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 190),
                child: IntorductionButtons(
                  () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 600),
                        reverseDuration: Duration(milliseconds: 500),
                        child: Bottomnavigationbar(),
                      ),
                    );
                  },
                  "Sign Up",
                  const Color(0xff5B58FB),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 140),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,

                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.9,
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.only(bottom: 70),
                child: Text(
                  """By Sign Up, you agree to our Terms Of 
            Service & Privacy Policy .""",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            title("Registriation "),
          ],
        ),
      ),
    );
  }
}

class title extends StatelessWidget {
  final String text;
  const title(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Padding(
        padding: EdgeInsetsGeometry.only(top: 10),
        child: Text(text, style: TextStyle(color: Colors.black54)),
      ),
    );
  }
}
