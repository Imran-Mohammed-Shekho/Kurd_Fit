import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/screens/bottomNavogation_UI/bottomnavigationbar.dart';
import 'package:gym/UI/screens/login&SignUP_UI/SignUp_screen.dart';
import 'package:gym/data/models/userData.dart';
import 'package:gym/services/signup_service.dart';
import 'package:gym/state/providers/landingScreen_Provider.dart';
import 'package:provider/provider.dart';

class CheckEmailVerification extends StatelessWidget {
  final UserCredential userCreditional;
  final TextEditingController emailController;
  final TextEditingController nameController;
  const CheckEmailVerification({
    super.key,
    required this.userCreditional,
    required this.emailController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<LandingscreenProvider>();
    final _usersCollection = FirebaseFirestore.instance.collection("users");
    final auth = FirebaseAuth.instance;

    void showSnackbarMessage(String message, Color color) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(message, style: const TextStyle(color: Colors.white)),
          behavior: SnackBarBehavior.fixed,
          duration: const Duration(seconds: 5),
        ),
      );
    }

    Future<void> verifiyEmailAndLoginUser() async {
      try {
        await auth.currentUser!.reload();
        showDialog(
          context: context,
          builder: (context) => Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          ),
        );
        await Future.delayed(Duration(seconds: 3));

        final user = userCreditional.user;

        if (auth.currentUser!.emailVerified) {
          if (user == null) {
            throw FirebaseAuthException(
              code: 'user-not-created',
              message: 'User account could not be created',
            );
          }
          showSnackbarMessage(
            "Email verified succsessfully",
            const Color.fromRGBO(56, 142, 60, 1),
          );
          final data = UserModel(
            emailController.text.trim(),
            nameController.text.trim(),
          );
          final result = await SignupService().saveUserData(
            uid: user.uid,
            age: prov.age,
            gender: prov.gender,
            name: prov.name,
            goal: prov.goal,
            fitnessLevel: prov.fitnessLevel,
            height: prov.height!.toInt(),
            issues: prov.issues,
            workoutsPerWeek: prov.workoutsPerWeek.toInt(),
            bodyFoucs: prov.bodyFoucs,
            weight: prov.weight,
            activityLevel: prov.activityLevel,
          );
          await _usersCollection.doc(user.uid).set(data.toSnap());

          await Future.delayed(const Duration(milliseconds: 500));
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          if (result == true) {
            Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const Bottomnavigationbar(),
              ),
            );
          } else {
            return;
          }
        } else {
          Navigator.pop(context);
          showSnackbarMessage(
            "Please Verify your email and Try again!",
            const Color.fromRGBO(244, 67, 54, 1),
          );
        }

        // showSuccessSnackBar("Account created successfully!", const Color.fromRGBO(56, 142, 60, 1),);
      } catch (e) {
        showSnackbarMessage("$e", const Color.fromRGBO(244, 67, 54, 1));
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Nutback.png"),
            fit: BoxFit.fill,
          ),
        ),

        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/chekemail.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Check your Email !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),

                  Text(
                    textAlign: TextAlign.center,
                    "We’ve Sent a Verification  link to your Email Address\n Please Verify your Email .",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 70),

                  GestureDetector(
                    onTap: () async {
                      verifiyEmailAndLoginUser();
                    },
                    child: _CheckEmailButton(
                      text: "I Verified",
                      color: const Color(0xff5B58FB),
                      textColor: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: _CheckEmailButton(
                      text: "Going back",
                      color: const Color.fromARGB(255, 255, 255, 255),
                      textColor: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _CheckEmailButton({
  required String text,
  required Color color,
  required Color textColor,
}) {
  return Container(
    width: 350,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 146, 146, 146),
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
