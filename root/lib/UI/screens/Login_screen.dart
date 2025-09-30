import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gym/UI/screens/Forget_screen.dart';
import 'package:gym/UI/screens/SignUp_screen.dart';
import 'package:gym/UI/screens/bottomnavigationbar.dart';
import 'package:gym/UI/screens/introduction_screen1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                'lib/assets/images/Background1.png',
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
                padding: const EdgeInsets.only(left: 35, right: 35, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassyTextField("Email", (value) {
                      setState(() {
                        email = value;
                      });
                    }),
                    SizedBox(height: 15),
                    GlassyTextField("Password", (value) {
                      setState(() {
                        password = value;
                      });
                    }),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 280,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,

                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.5,
                    ),
                  ),
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
                      MaterialPageRoute(
                        builder: (context) => Bottomnavigationbar(),
                      ),
                    );
                  },
                  "Login",
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
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
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
                  """By Login, you agree to our Terms Of 
            Service & Privacy Policy .""",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            title("Login"),
          ],
        ),
      ),
    );
  }
}

class GlassyTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const GlassyTextField(this.hintText, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.8),
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: TextField(
              onChanged: onChanged,
              obscureText: hintText == "Password" ? true : false,

              // maxLength: 24,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
