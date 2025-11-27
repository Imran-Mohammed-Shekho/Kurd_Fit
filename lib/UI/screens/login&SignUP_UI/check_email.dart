import 'package:flutter/material.dart';
import 'package:gym/UI/CommonWidget/resuableProgressIndicator.dart';
import 'package:gym/UI/screens/landingScreen_UI/genderScreen/GenderButtom.dart';
import 'package:gym/UI/screens/login&SignUP_UI/Login_screen.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
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
                  "We’ve Sent a Password rest link to your Email Address\n Please Check your Inbox.",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 70),

                buildButtom(
                  ontap: () async {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: reusableProgressIndicator()),
                    );
                    await Future.delayed(Duration(seconds: 1));
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  text: "Back to login",
                  isTrue: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
