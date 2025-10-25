import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/UI/screens/Login_screen.dart';
import 'package:gym/UI/screens/bottomnavigationbar.dart';
import 'package:gym/UI/screens/introduction_screen1.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = '';
  String password = '';
  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> SignupMethod() async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in both email and password")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnavigationbar()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade700,
          duration: Duration(seconds: 3),
          content: Text(
            "You login in successfully ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/Nutback.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 30),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kurd Fit",
                      style: GoogleFonts.pacifico(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Training, Gym, Strength",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),
              Center(
                child: Image.asset(
                  "lib/assets/images/man.png",
                  width: size.width * 0.25,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GlassyTextField("Email", (value) {
                        email = value;
                      }, 60),
                      const SizedBox(height: 15),
                      GlassyTextField("Password", (value) {
                        password = value;
                      }, 60),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.059),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.083),
                child: Column(
                  children: [
                    Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Color(0xff5B58FB),
                            )
                          : IntorductionButtons(
                              SignupMethod,
                              "Sign Up",
                              const Color(0xff5B58FB),
                            ),
                    ),
                    SizedBox(height: size.height * 0.059),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
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
                    SizedBox(height: 20),
                    // Terms text
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: const Text(
                        "By signing up, you agree to our Terms Of Service & Privacy Policy.",
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
