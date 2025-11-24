import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/glassy_text_F.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderScreen.dart';
import 'package:gym/UI/screens/landingScreen_UI/questionScreenControll.dart';

import 'package:gym/UI/screens/login&SignUP_UI/check_email.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  static final _emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  Future restPassword() async {
    if (_emailController.text.isEmpty) {
      _showMessag("Please enter your email address", Colors.red);
      return;
    } else if (!_emailRegex.hasMatch(_emailController.text)) {
      _showMessag("Please enter vailde email", Colors.red);
      return;
    }
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => Center(child: reusableProgressIndicator()),
      );
    }
    try {
      final auth = FirebaseAuth.instance;

      await auth.sendPasswordResetEmail(email: _emailController.text);
      await Future.delayed(Duration(seconds: 3));
      if (!mounted) return;

      Navigator.pop(context);

      _showMessag(
        "rest link sccessefully sent to ${_emailController.text}",
        Colors.green,
      );
      await Future.delayed(Duration(seconds: 1));

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckEmail()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      _showMessag(e.code, Colors.red);
    } catch (e) {
      _showMessag(e, Colors.red);
    } finally {}
  }

  void _showMessag(message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: color,
        duration: Duration(seconds: 2),
        content: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: kwhite),
          ),
        ),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "Forgot your password?",

              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kwhite,
              ),
            ),

            SizedBox(height: 20),

            Text(
              textAlign: TextAlign.center,
              """Enter your email below to receive a\npassword reset link.""",

              style: TextStyle(
                fontSize: 14,
                color: kwhite.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: GlassyTextField(
                  "Email",
                  (value) {},
                  60,
                  _emailController,
                ),
              ),
            ),
            Spacer(),
            buildButtom(
              ontap: () {
                restPassword();
              },
              text: "Send",
              isTrue: false,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
